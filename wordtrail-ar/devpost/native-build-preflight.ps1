# Checks a NEW saved SPECS Base Template project. Does not itself create, build or validate a Lens.
param([switch]$InstallDevpostSkill)
$ErrorActionPreference = 'Stop'
$native = Get-ChildItem -Filter '*.esproj' -File -ErrorAction SilentlyContinue
if ($null -eq $native) {throw 'No native .esproj. Create Lens Studio > SPECS > Base Template > File > Save As; run this from that folder.'}
Write-Host "Found native Lens Studio project: $($native[0].Name)"
if (-not (Test-Path '.mcp.json')) {Write-Warning 'No .mcp.json. Open project in Lens Studio, configure MCP and restart agent from this folder.'}
foreach ($n in @('git','node','npx')) {if (-not (Get-Command $n -ErrorAction SilentlyContinue)) {Write-Warning "$n missing"}}
if ($InstallDevpostSkill) {& npx skills add challengepost/learn-specs --all -y; if ($LASTEXITCODE -ne 0) {throw 'Skill install failed.'}}
Write-Host 'Keep Lens Studio open. Connect CLAD, run the official plan-lens interview, approve its output, then ask CLAD to build through Lens Studio MCP.'
Write-Host 'Test in native Interactive Preview and LEAF; record a genuine native demo and commit all .esproj, assets and official devpost docs before submitting.'
Write-Warning 'Web simulation or a provisional script is NOT an eligible completed SPECS Lens.'
