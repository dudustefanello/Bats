Param(
  [string]$arquivo,
  [string]$tipo
)

[xml]$Xml = Get-Content -Path $arquivo

$xml.Project.PropertyGroup[0].Config.InnerText  = $tipo

$xml.save($arquivo);
