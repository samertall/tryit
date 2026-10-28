# WordTrail AR: prepare a REAL saved SPECS Lens Studio project for the Codex + CLAD workflow.
# Does not build or submit without Lens Studio, an authenticated coding agent,
# the official learner-led plan-lens interview, and native LEAF/preview verification.
[CmdletBinding()]
param(
  [Parameter(Mandatory=$true)][string]$NativeProjectFolder,
  [switch]$LaunchCodex
)
$ErrorActionPreference='Stop'
$project=(Resolve-Path -LiteralPath $NativeProjectFolder).Path
$esproj=@(Get-ChildItem -LiteralPath $project -Filter '*.esproj' -File)
if($esproj.Count -eq 0){throw 'Save a SPECS Base Template in Lens Studio first (File > Save As), then provide its folder.'}
if(!(Test-Path -LiteralPath (Join-Path $project '.mcp.json'))){Write-Warning '.mcp.json missing: keep Lens Studio open and connect Lens Studio MCP.'}
foreach($tool in @('git','node','npx','codex')){
  if(!(Get-Command $tool -ErrorAction SilentlyContinue)){throw "Install $tool first; see https://learn-specs.devpost.com/resources"}
}
$packageRoot=Split-Path -Parent $PSCommandPath
$refs=Join-Path $project 'references\wordtrail'
New-Item -ItemType Directory -Path $refs -Force|Out-Null
foreach($pair in @(
  @('devpost\design-brief.md','proposed-concept.md'),
  @('lens-src\WordTrailController.ts','controller-example.ts'),
  @('devpost\clad-handoff.md','clad-reference.md')
)){
  $source=Join-Path $packageRoot $pair[0]
  if(Test-Path -LiteralPath $source){Copy-Item -LiteralPath $source -Destination (Join-Path $refs $pair[1]) -Force}
}
$instructions=@'
WORDTRAIL AR — FIRST SESSION (NATIVE LENS STUDIO)
1. Keep the saved SPECS Base Template project open in Lens Studio.
2. In Codex, use /plugins and install ls-clad from ls-extensions; restart Codex.
3. Use /mcp to confirm lens-studio MCP is connected to that SAME project.
4. Say: "Run the official plan-lens skill. Our concept is WordTrail AR, a tabletop spatial phonics experience. Read references/wordtrail/proposed-concept.md only as a proposal. Ask your required learner-led questions, then produce and approve the official devpost/design-brief.md."
5. AFTER the official skill has completed, start a new Codex chat in this folder:
"Read devpost/design-brief.md and build it for SPECS using CLAD and Lens Studio MCP. Implement the approved WordTrail AR spatial phonics experience with SIK and UI Kit, correct/incorrect letter feedback, CAT and SUN rounds, and restart. Verify in Interactive Preview, write/run LEAF tests for every done criterion, and report results. Do not confuse the web concept with a native Lens."
6. Save the real .esproj, scene, assets, scripts and official devpost/ documents in a public GitHub repo. Record the genuine Lens Studio Interactive Preview and upload a public YouTube demo under 3 minutes.
7. Answer the Devpost submission's technology and experience questions truthfully at https://devpost.com/software/wordtrail-ar
IMPORTANT: This launcher, web concept and preliminary design proposal are NOT a CLAD-built native Lens.
'@
Set-Content -LiteralPath (Join-Path $project 'WORDTRAIL-START-HERE.txt') -Value $instructions -Encoding UTF8
Push-Location $project
try{
  & npx skills add challengepost/learn-specs --all -y
  if($LASTEXITCODE -ne 0){throw 'The official Devpost skill install failed.'}
  & codex plugin marketplace add 'https://github.com/lens-studio-devs/ls-extensions.git'
  if($LASTEXITCODE -ne 0){Write-Warning 'Marketplace registration failed or was already done. Use /plugins to check.'}
  Write-Host 'Next: install ls-clad through /plugins and complete the official plan-lens interview.' -ForegroundColor Green
  Write-Host ('Instructions: '+(Join-Path $project 'WORDTRAIL-START-HERE.txt'))
  if($LaunchCodex){& codex}
} finally {Pop-Location}