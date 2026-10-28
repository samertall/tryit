# Required native CLAD + Lens Studio build

This repo has **no working native Lens Studio project yet**. To become eligible:

1. Install Lens Studio 5.22+ on Windows 11/macOS 12+. Use 5.23.2 if the 5.24 SPECS sign-in fails.
2. In Lens Studio choose **SPECS > Base Template > File > Save As**. Keep the generated native `.esproj` and `.mcp.json`.
3. Open the saved project in Lens Studio and start your coding agent in that SAME project directory.
4. Install and connect Lens Studio MCP plus Snap CLAD: https://developers.specs.com/docs/clad
5. Run `npx skills add challengepost/learn-specs --all -y` in that directory.
6. Invoke `plan-lens`. Complete the official learner-led interview; the agent writes and approves `devpost/design-brief.md`. Treat this repository's document as a **proposal**, not a substitute.
7. Start a fresh chat and send:

   > Read devpost/design-brief.md and build WordTrail AR for SPECS in this native Lens Studio project. Follow the approved brief. Use SPECS UI Kit and SIK interactables, so a pinch is testable with the mouse. Build CAT and SUN rounds with error feedback, progress slots and completion reveal. Keep scene content at arm's length and below eye level. Run /verify-preview after edits, then write and run LEAF scenarios for the done criteria and report passes and failures.

8. Save and commit all native `.esproj`, assets, TypeScript scripts, official `devpost/` documents and LEAF test evidence to a dedicated public repository.
9. Record the working Lens Studio Interactive Preview, not the browser concept. Upload a public YouTube video <3 minutes and include URL on Devpost.
10. Complete every required form answer honestly; only submit after genuine verification.

Sources: https://github.com/challengepost/learn-specs and https://learn-specs.devpost.com/resources
