# WordTrail AR — spatial phonics for SPECS

**Status: concept and developer handoff. NOT an eligible finished Lens.**

A new educational concept started October 28, 2026. Learners pinch world-space sound stones on a simulated tabletop to build CAT and SUN. A correct sequence advances the trail, an incorrect selection gives gentle feedback, and the completed word reveals a reward.

## What works
- Interactive browser concept under `preview/`
- Deterministic word-building engine under `core/`
- Node-based logic tests under `tests/`
- Proposed Lens Studio TypeScript scaffold under `lens-src/`

## What is NOT complete
**Lens Studio, CLAD, Lens Studio MCP, the official plan-lens learner interview, a saved native SPECS `.esproj`, LEAF tests, and a genuine Lens Studio preview recording have NOT been performed.** Do not claim the web preview is a working Lens or a hackathon demo.

## Run the concept
With Node 18+: `node --test wordtrail-ar/tests/engine.test.mjs`. To view the browser concept, host the repository root with `python -m http.server 4173` and open `http://localhost:4173/wordtrail-ar/preview/`.

## Official workflow
Create a SPECS Base Template in Lens Studio on Windows/macOS, install the [Devpost Learn skill](https://github.com/challengepost/learn-specs) and [CLAD](https://developers.specs.com/docs/clad), use the learner-led `plan-lens` interview, have CLAD build through Lens Studio MCP, verify in Interactive Preview with LEAF, and record a real <3-minute YouTube demo. See [CLAD handoff](devpost/clad-handoff.md).

The [full downloadable concept package](https://learn-specs.devpost.com/) may contain additional offline concept artwork. License: MIT. Not affiliated with Snap or Devpost.


## Additional verification and native build handoff (October 28, 2026)

The browser prototype also passed **13 of 13 Playwright interaction checks** (including error recovery, both word reveals, and restart). Those are **browser tests only**, not Lens Studio LEAF results. A 25-second concept recording and browser test script are included in the downloadable package, clearly marked as non-native.

The qualifying SPECS Lens has **not** yet been created in a new Lens Studio Base Template; the official Devpost Learn `plan-lens` interview, CLAD and Lens Studio MCP build, LEAF tests and genuine Lens Studio preview recording are **still pending**. See `devpost/verification-status.md` and `devpost/real-lens-demo-shotlist.md` for evidence requirements, and `devpost/native-build-preflight.ps1` for Windows environment checks. Do not substitute the browser demo or make claims of CLAD usage until the native build actually happens.
