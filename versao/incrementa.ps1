param([int]$arquivo=0)

switch ($arquivo){
    1 { $caminho = "C:\Fontes\flextotal_5_0_2\Flextotal\src\retaguarda\FlexTotal.dproj"
        $corta1 = [int]82; $corta2 = [int]83
      }
    2 { $caminho = "C:\Fontes\flextotal_5_0_2\Flextotal\src\integracao pafecf\IntegracaoPAFECF.dproj"
        $corta1 = [int]93; $corta2 = [int]94
      }
    3 { $caminho = "C:\Fontes\flextotal_5_0_2\Flextotal\src\importa pedidos venda\ImportacaoPedidosVenda.dproj"
        $corta1 = [int]107; $corta2 = [int]108
      }
    4 { $caminho = "C:\Fontes\flextotal_5_0_3\Flextotal\src\retaguarda\FlexTotal.dproj"
        $corta1 = [int]82; $corta2 = [int]83
      }
    5 { $caminho = "C:\Fontes\flextotal_5_0_3\Flextotal\src\integracao pafecf\IntegracaoPAFECF.dproj"
        $corta1 = [int]93; $corta2 = [int]94
      }
    6 { $caminho = "C:\Fontes\flextotal_5_0_3\Flextotal\src\importa pedidos venda\ImportacaoPedidosVenda.dproj"
        $corta1 = [int]107; $corta2 = [int]108
      }
}

[xml]$Xml = Get-Content -Path $caminho

if ($xml.Project.PropertyGroup[8].VerInfo_Keys[$corta2] -eq ';') {
    $string1 = $xml.Project.PropertyGroup[8].VerInfo_Keys.substring(0, $corta1)
    $string2 = $xml.Project.PropertyGroup[8].VerInfo_Keys.substring($corta2)
    $int = $xml.Project.PropertyGroup[8].VerInfo_Keys[$corta1] - 48

    if ($int1 -eq 9) {
      $xml.Project.PropertyGroup[8].VerInfo_Keys = $string1 + '1' + '0' + $string2
    }
    else {
      $int = [int]$int + [int]1
      $xml.Project.PropertyGroup[8].VerInfo_Keys = $string1 + $int + $string2
    }
}
else {
    $string1 = $xml.Project.PropertyGroup[8].VerInfo_Keys.substring(0, $corta1)
    $string2 = $xml.Project.PropertyGroup[8].VerInfo_Keys.substring($corta2 + 1)
    $int1 = $xml.Project.PropertyGroup[8].VerInfo_Keys[$corta1] - 48
    $int2 = $xml.Project.PropertyGroup[8].VerInfo_Keys[$corta2] - 48

    if ($int2 -eq 9) {
      $int1 = [int]$int1 + [int]1
      $int2 = [int]0
    }
    else {
      $int2 = [int]$int2 + [int]1
    }

    $xml.Project.PropertyGroup[8].VerInfo_Keys = $string1 + $int1 + $int2 + $string2
}

$build = [int]$xml.Project.PropertyGroup[8].VerInfo_Build

$build = $build + 1

$xml.Project.PropertyGroup[8].VerInfo_Build = '' + $build

$xml.save($caminho);
