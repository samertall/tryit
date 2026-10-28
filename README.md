# SunuSats — merchant-focused Lightning prototype
A French-first, mobile-friendly, non-custodial Lightning wallet companion for Senegalese micro-merchants. **Hackathon proof of concept, not a production financial service.**

## Public demonstration
Open the deployed site in a modern browser (HTTPS required for clipboard). The interface loads without a wallet in clearly marked simulation mode. Receive generates **DEMO-ONLY** strings (not payable on Bitcoin), check simulates an incoming transaction, Send simulates the outgoing payment, and Activity displays a fictional ledger. A fake balance is explicitly labeled.

## Real wallet, Nostr NIP-47
Connect a dedicated Nostr Wallet Connect URI to an existing **mainnet** Lightning wallet. The browser imports the version-pinned Alby NWC SDK only when connecting. Supported methods: get_info, get_balance, make_invoice, pay_invoice, optional lookup_invoice and list_transactions. Wallet-side permission limits and budgets are essential. The private NWC URI is kept in memory, **never persisted**, never sent to a SunuSats backend. Source SDK: https://github.com/getAlby/js-sdk .

### Transaction flow
1. Create a budget-limited NWC connection in your own wallet; revoke it when finished.
2. Paste the NWC URI in the Connect dialog. Do not share the URI, even with developers.
3. Receive creates a real BOLT11 invoice and locally renders a QR code (online CDN needed).
4. Send accepts a **fixed amount** BOLT11 mainnet invoice up to 10,000 sats. The local prefix check is only a preview, **not a cryptographic validation**; the wallet must verify the complete invoice. User confirms explicitly before NWC pay_invoice.
5. Check payment uses wallet lookup permission, if available.

## Security and limitations
No custody; no bank transfer; no exchange; no FIAT claims; no merchant identity verification; no KYC. Do **not** use meaningful amounts. The payment integration has not been tested with a funded wallet. It has not been audited. CDN-loaded SDK and QR modules should be self-hosted with integrity locks before production. Nostr relays need network access. Demo transaction records are stored only in browser localStorage; wallet secrets never are.

## Local run
Save index.html and run any static file server, for example python3 -m http.server 4173. Source contains HTML, CSS and JavaScript inline to simplify static deployment.

## Why
Local-value hypothesis: a low-bandwidth merchant checkout with FR-first copy, clear invoice status, minimal cognitive load, and wallet sovereignty. Local merchant interviews and impact validation are future work; no fabricated adoption results.

## Project
Built 2026-10-28 for Dakar Bitcoin Hack by BTrust. MIT license. AI-assisted design and development; no third-party AI processes wallet data. Independent source package with extended documentation and tests is distributed separately. The contest rules state that participants should reside in Africa and Devpost also flags students only; eligibility requires organizer verification.
