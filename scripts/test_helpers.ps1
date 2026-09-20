# Script to generate Laporan_Proyek_Akhir_Front_End_SkillGap_AI.docx
param(
    [string]$TemplatePath = "d:\SEMESTER 3\FRONT END\Skillgap-AI-main\Skillgap-AI-main\SKPL_SkillGapAI_Revisi_Aktor.docx",
    [string]$OutputPath = "d:\SEMESTER 3\FRONT END\Skillgap-AI-main\Skillgap-AI-main\Laporan_Proyek_Akhir_Front_End_SkillGap_AI.docx"
)

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

function Escape-Xml([string]$str) {
    if ([string]::IsNullOrEmpty($str)) { return "" }
    return $str.Replace("&", "&amp;").Replace("<", "&lt;").Replace(">", "&gt;").Replace('"', "&quot;").Replace("'", "&apos;")
}

function P([string]$text, [string]$align="both", [bool]$bold=$false, [bool]$italic=$false, [int]$size=22, [string]$color="000000", [int]$spaceBefore=0, [int]$spaceAfter=120, [double]$lineSpacing=1.15) {
    $bXml = if ($bold) { "<w:b/><w:bCs/>" } else { "" }
    $iXml = if ($italic) { "<w:i/><w:iCs/>" } else { "" }
    $cXml = if ($color -ne "000000") { "<w:color w:val=""$color""/>" } else { "" }
    $lineVal = [int]($lineSpacing * 240)
    $safeText = Escape-Xml $text
    return "<w:p><w:pPr><w:jc w:val=""$align""/><w:spacing w:before=""$spaceBefore"" w:after=""$spaceAfter"" w:line=""$lineVal"" w:lineRule=""auto""/></w:pPr><w:r><w:rPr><w:rFonts w:ascii=""Times New Roman"" w:hAnsi=""Times New Roman"" w:cs=""Times New Roman""/><w:sz w:val=""$size""/><w:szCs w:val=""$size""/>$bXml$iXml$cXml</w:rPr><w:t xml:space=""preserve"">$safeText</w:t></w:r></w:p>"
}

function PageBreak() {
    return "<w:p><w:r><w:br w:type=""page""/></w:r></w:p>"
}

Write-Host "Helper functions loaded successfully."
