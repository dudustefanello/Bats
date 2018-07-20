## Para Fazer:
* Programa em python para documentação:
  1. Que receba um cabeçalho de uma função e retorne a documentação na forma:
  ```Pascal
  /// <summary>
  ///   Nome da função
  /// </summary>
  /// <param name="NomeDoParametro">TTipoDoParametro</param> (quando houver)
  /// <returns>TTipoDoRetorno</returns> (Quando for function)
  ```
  2. Que receba uma documentação no formato:
  ```Pascal
  {
    Busca o preço do item na tabela padrão e caso não encontre com a unidade de medida informada
    converte para a unidade padrão de venda e pesquisa novamente
    @param id_item Id do item a pesquisar
    @param cd_tabela_padrao Código da tabela padrão
    @param un_medida Unidade de venda do item
    @param prazo_medio Prazo de venda do item
    @param qt_venda Quantidade vendida
    @Result O valor do item na tabela padrão, -1 se não encontrar
  }
  ```
  E Retorne:
  ```Pascal
  /// <summary>
  ///   Busca o preço do item na tabela padrão e caso não encontre com a unidade de medida
  ///   informada converte para a unidade padrão de venda e pesquisa novamente
  /// </summary>
  /// <param name="id_item">Id do item a pesquisar</param>
  /// <param name="cd_tabela_padrao">Código da tabela padrão</param>
  /// <param name="un_medida">Unidade de venda do item</param>
  /// <param name="prazo_medio">Prazo de venda do item</param>
  /// <param name="qt_venda">Quantidade vendida</param>
  /// <returns> O valor do item na tabela padrão, -1 se não encontrar</returns>
  ```

## Para Terminar:
* Programa que formata os comandos SQL:
  1. Do Flex para o DBeaver;
  2. Do Flex para o Flex;
  3. Do DBeaver para o DBeaver;

## Para documentar:
* Geração de Versão
