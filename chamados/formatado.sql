SELECT t.*,
	CASE
		WHEN (t.vl_saldo > 0)
			AND (t.percentual_multa_contas > 0)
			THEN round(((t.vl_saldo * t.percentual_multa_contas) * 0.01), 2)
		ELSE 0
		END AS vl_multa_contas
FROM (
	WITH filial_geradora AS (
			SELECT cd_filial,
				nm_filial AS nm_cedente,
				cnpj AS cedente_inscricao,
				logradouro AS cedente_end_nm_logradouro,
				numero AS cedente_end_numero,
				complemento AS cedente_end_complemento,
				bairro AS cedente_end_nm_bairro,
				cidade.nm_cidade AS cedente_end_nm_cidade,
				cidade.uf AS cedente_end_uf,
				filial.cep AS cedente_end_cep
			FROM filial
			JOIN cidade ON filial.cd_cidade = cidade.cd_cidade
			)
	SELECT DISTINCT par.id_geral AS id_parcela,
		CASE
			WHEN co.cd_filial_geradora IS NOT NULL
				THEN (
						SELECT nm_cedente
						FROM filial_geradora
						WHERE cd_filial = co.cd_filial_geradora
						)
			ELSE f.nm_filial
			END AS nm_cedente,
		par.vl_nominal AS vl_parcela,
		par.dt_vcto,
		par.nosso_numero AS nr_nosso_numero,
		f.nm_fantasia AS nm_filial,
		forma.nm_forma_pgto,
		'' S '' AS fl_check,
		co.local_pagamento,
		co.nm_especie,
		cpr.nr_documento,
		cfp.nr_carteira,
		cpr.dt_emissao,
		par.vl_desconto,
		0 AS vl_outras_deducoes,
		0 AS vl_abatimento,
		par.vl_multa AS vl_mora,
		par.vl_juro AS vl_juros,
		0 AS vl_outros_acrescimos,
		co.mensagem AS instrucoes,
		coalesce(cpo.obs || '' '', '''') || co.mensagem_protesto AS observacoes,
		par.nr_sequencial_nosso_numero,
		co.fl_aceite,
		co.nr_convenio,
		CASE
			WHEN co.cd_filial_geradora IS NOT NULL
				THEN (
						SELECT cedente_inscricao
						FROM filial_geradora
						WHERE cd_filial = co.cd_filial_geradora
						)
			ELSE f.cnpj
			END AS cedente_inscricao,
		c.cnpj_cpf AS sacado_inscricao,
		'' CNPJ '' AS cedente_tp_inscricao,
		CASE c.tp_pessoa
			WHEN '' F ''
				THEN '' CPF ''
			ELSE '' CNPJ ''
			END AS sacado_tp_inscricao,
		CASE
			WHEN co.cd_filial_geradora IS NOT NULL
				THEN (
						SELECT cedente_end_nm_logradouro
						FROM filial_geradora
						WHERE cd_filial = co.cd_filial_geradora
						)
			ELSE f.logradouro
			END AS cedente_end_nm_logradouro,
		c.endereco_logradouro AS sacado_end_nm_logradouro,
		'''' AS cedente_end_tp_logradouro,
		'''' AS sacado_end_tp_logradouro,
		CASE
			WHEN co.cd_filial_geradora IS NOT NULL
				THEN (
						SELECT cedente_end_numero
						FROM filial_geradora
						WHERE cd_filial = co.cd_filial_geradora
						)
			ELSE f.numero
			END AS cedente_end_numero,
		c.endereco_numero AS sacado_end_numero,
		CASE
			WHEN co.cd_filial_geradora IS NOT NULL
				THEN (
						SELECT cedente_end_complemento
						FROM filial_geradora
						WHERE cd_filial = co.cd_filial_geradora
						)
			ELSE f.complemento
			END AS cedente_end_complemento,
		c.endereco_complemento AS sacado_end_complemento,
		CASE
			WHEN co.cd_filial_geradora IS NOT NULL
				THEN (
						SELECT cedente_end_nm_bairro
						FROM filial_geradora
						WHERE cd_filial = co.cd_filial_geradora
						)
			ELSE f.bairro
			END AS cedente_end_nm_bairro,
		c.bairro AS sacado_end_nm_bairro,
		CASE
			WHEN co.cd_filial_geradora IS NOT NULL
				THEN (
						SELECT cedente_end_nm_cidade
						FROM filial_geradora
						WHERE cd_filial = co.cd_filial_geradora
						)
			ELSE cf.nm_cidade
			END AS cedente_end_nm_cidade,
		cc.nm_cidade AS sacado_end_nm_cidade,
		CASE
			WHEN co.cd_filial_geradora IS NOT NULL
				THEN (
						SELECT cedente_end_uf
						FROM filial_geradora
						WHERE cd_filial = co.cd_filial_geradora
						)
			ELSE cf.uf
			END AS cedente_end_uf,
		cc.uf AS sacado_end_uf,
		pf.nm_pais AS cedente_end_nm_pais,
		pc.nm_pais AS sacado_end_nm_pais,
		CASE
			WHEN co.cd_filial_geradora IS NOT NULL
				THEN (
						SELECT cedente_end_cep
						FROM filial_geradora
						WHERE cd_filial = co.cd_filial_geradora
						)
			ELSE f.cep
			END AS cedente_end_cep,
		c.cep AS sacado_end_cep,
		co.nr_conta,
		co.nr_dv_conta,
		co.nr_agencia,
		co.nr_dv_agencia,
		co.nr_banco,
		c.e_mail AS sacado_email,
		c.nm_cliente AS nm_sacado,
		co.cd_convenio,
		par.vl_saldo,
		ba.nm_banco,
		co.nm_convenio,
		co.nm_agencia,
		cfp.sg_carteira,
		co.sg_especie,
		co.op_conta,
		co.unidade_cedente,
		bo.cd_bordero AS bordero,
		f.mail_porta AS porta,
		f.mail_servidor AS servidor,
		f.email AS email_cedente,
		f.mail_senha AS senha,
		f.mail_login AS usuario,
		CASE
			WHEN f.mail_fl_ssl = '' S ''
				THEN '' TRUE ''
			ELSE '' FALSE ''
			END AS ssl,
		co.fl_emissor,
		(
			SELECT ccap.vl_atributo
			FROM cob_convenio_atributo ccap
			WHERE ccap.nm_campo = '' POSTO ''
				AND ccap.cd_convenio = co.cd_convenio
			) AS posto,
		(
			SELECT ccatp.vl_atributo
			FROM cob_convenio_atributo ccatp
			WHERE ccatp.nm_campo = '' TP_CONVENIO ''
				AND ccatp.cd_convenio = co.cd_convenio
			) AS tipo_convenio,
		cast((
				SELECT (translate(coalesce(configuracao_sistema.vl_entrada, '' 0 ''), '', '', ''.'')) AS vl_entrada
				FROM configuracao_sistema
				WHERE configuracao_sistema.cd_entrada = 59
				) AS NUMERIC) AS taxa_juros,
		CASE forma.tipo_multa
			WHEN '' P ''
				THEN forma.vl_multa
			WHEN '' V ''
				THEN 100 * forma.vl_multa / par.vl_saldo
			ELSE (
					SELECT cast(coalesce(configuracao_sistema.vl_entrada, '' 0 '') AS NUMERIC) AS vl_entrada
					FROM configuracao_sistema
					WHERE configuracao_sistema.cd_entrada = 58
					)
			END AS percentual_multa_contas,
		cast(cpr.nr_documento || ''.'' || par.parcela AS VARCHAR) AS nr_parcela_titulo,
		co.nr_dias_protesto,
		co.fl_protesto,
		co.fl_remessa,
		par.parcela AS nr_parcela_documento,
		cast((
				SELECT configuracao_sistema.vl_entrada
				FROM configuracao_sistema
				WHERE configuracao_sistema.cd_entrada = 65
				) AS INTEGER) AS dias_carencia,
		func_mensagem_livre_documento(par.id_cpr_documento) AS mensagemlivre,
		co.cd_instrucao1,
		co.cd_instrucao2,
		coalesce(ace.fl_aceite, '''') AS fl_aceite_agrupamento,
		CASE coalesce(ace.fl_aceite, '''')
			WHEN '' N''
				THEN '' NÃO ACEITO ''
			WHEN '' S ''
				THEN '' ACEITO ''
			ELSE ''''
			END AS desc_aceite_agrupamento,
		par.id_cpr_documento,
		cpr.cd_clifor AS cd_cliente,
		cfp.cd_filial,
		par.dt_hr_impressao,
		cpr.cd_cond_pgto,
		cond.nm_cond_pgto,
		c.cd_matriz,
		cfp.fl_registrada,
		bo.cd_bordero,
		par.id_geral AS id_parcela_destino,
		cfp.cd_forma_pgto,
		co.fl_retorno_remessa,
		cs.nr_sequencial,
		cr.nr_sequencial AS nr_ultima_remessa,
		CASE
			WHEN coalesce(forma_cond_pgto.permite_desconto_antecipado, false)
				THEN ccb.pc_desc_pgto_pontual
			ELSE 0
			END AS pc_desc_pgto_pontual,
		co.mensagem,
		co.fl_padrao_remessa,
		co.mensagem_protesto,
		c.nm_cliente,
		c.cnpj_cpf AS inscricao,
		f.mail_login AS nome_email,
		co.cd_convenio AS convenio,
		(
			CASE et.fl_acertado
				WHEN '' F ''
					THEN et.dt_acerto
				ELSE NULL
				END
			) AS dt_acerto,
		cpr.id_geral AS cpr_documento,
		et.nr_carga,
		coalesce(ren.fl_ativa, '' N'') AS fl_tem_renegociacao,
		coalesce(ren.vl_juros_calculados, 0) AS vl_juros_renegociacao,
		ren.dt_novo_vcto AS dt_vcto_renegociacao,
		variacao.vl_atributo AS variacao_carteira,
		cast(coalesce(nullif(co.nr_dias_carencia_multa, ''''), nullif((
						SELECT vl_entrada
						FROM configuracao_sistema
						WHERE cd_entrada = 15028
						), ''''), '' 0 '') AS INTEGER) AS nr_dias_carencia_multa,
		co.vl_outras_despesas_cobranca,
		bp.id_geral AS id_bordero_parcela
	FROM cob_bordero_parcela AS bp
	JOIN cob_bordero AS bo ON bo.id_geral = bp.id_bordero
	JOIN cpr_parcela AS par ON bp.id_parcela = par.id_geral
	LEFT JOIN cpr_parcela_obs AS cpo ON par.id_geral = cpo.id_cpr_parcela
	JOIN cpr_documento AS cpr ON cpr.id_geral = par.id_cpr_documento
	LEFT JOIN nfc ON cpr.id_geral = nfc.id_cpr_documento
	LEFT JOIN entrega_transp_dcto AS etd ON nfc.id_geral = etd.id_nfc
	LEFT JOIN entrega_transp AS et ON etd.id_entrega_transp = et.id_geral
	LEFT JOIN cpr_parcela_aceite AS ace ON par.id_geral = ace.id_cpr_parcela
	JOIN cliente AS c ON c.cd_cliente = cpr.cd_clifor
	LEFT JOIN cidade AS cc ON c.cd_cidade = cc.cd_cidade
	LEFT JOIN pais AS pc ON pc.cd_pais = cc.cd_pais
	JOIN filial AS f ON f.cd_filial = cpr.cd_filial
	LEFT JOIN cidade AS cf ON f.cd_cidade = cf.cd_cidade
	LEFT JOIN pais AS pf ON pf.cd_pais = cf.cd_pais
	JOIN cta_forma_pgto AS forma ON forma.cd_forma_pgto = par.cd_forma_pgto
	JOIN cob_convenio_forma_pgto AS cfp ON cfp.cd_forma_pgto = par.cd_forma_pgto
		AND cfp.cd_filial = cpr.cd_filial
	JOIN cob_convenio AS co ON co.cd_convenio = cfp.cd_convenio
		AND co.cd_convenio = bo.cd_convenio
	LEFT JOIN cob_convenio_sequencial_nosso_numero AS cs ON co.cd_convenio = cs.cd_convenio
		AND cpr.cd_filial = cs.cd_filial
	LEFT JOIN cob_convenio_sequencial_remessa AS cr ON co.cd_convenio = cr.cd_convenio
	JOIN banco AS ba ON co.nr_banco = ba.cd_banco
	LEFT OUTER JOIN cob_convenio_atributo AS variacao ON variacao.cd_convenio = co.cd_convenio
		AND variacao.nm_campo ilike '' CARTEIRAVARIACAO ''
	JOIN cta_cond_pgto AS cond ON cond.cd_cond_pgto = cpr.cd_cond_pgto
	LEFT JOIN forma_cond_pgto ON forma_cond_pgto.cd_cond_pgto = cond.cd_cond_pgto
		AND forma_cond_pgto.cd_forma_pgto = forma.cd_forma_pgto
	LEFT JOIN cliente_cobranca AS ccb ON ccb.cd_cliente = c.cd_cliente
	LEFT JOIN cpr_parcela_renegociacao AS ren ON par.id_geral = ren.id_cpr_parcela
		AND ren.fl_ativa ilike '' S ''
	WHERE bp.id_bordero = :id_bordero
	) t
ORDER BY t.id_parcela
