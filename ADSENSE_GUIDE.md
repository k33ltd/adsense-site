# AdSense Content Strategy & Compliance Guide

## Content Types That Get Approved & Earn

### High-RPM Niches (2024 data)
| Niche | Avg RPM | Competition | Content Angle |
|-------|---------|-------------|---------------|
| Personal finance / credit cards | $15-50 | High | Calculators, comparisons, "how I did X" |
| Insurance (health, auto, life) | $20-60 | High | Quote guides, state-specific rules |
| SaaS / B2B software | $10-30 | Medium | "Best X for Y use case", migration guides |
| Health / medical (non-YMYL) | $8-20 | Medium | Symptom guides, treatment comparisons |
| Home improvement / DIY | $5-15 | Low | Step-by-step with photos, tool reviews |
| Parenting / baby gear | $5-12 | Medium | "Best X for [age/stage]", safety guides |
| Pet care | $4-10 | Low | Breed guides, health issues, product picks |

### Content Formats That Convert
1. **"Best X for Y" comparisons** — 2000-4000 words, comparison table, clear winner
2. **Step-by-step tutorials** — Screenshots/photos at each step, ~1500-3000 words
3. **Calculators / tools** — Interactive, keeps users on page 2-5 minutes
4. **Data-driven analyses** — "I analyzed 500 X and found Y" — unique data = links
5. **Problem-solution posts** — "Why your X does Y and how to fix it"

### Content to Avoid (Policy Risks)
- ❌ Scraped/rewritten content (thin content penalty)
- ❌ Medical advice without disclaimer + author credentials (YMYL)
- ❌ Financial advice without disclaimer (YMYL)
- ❌ Adult, gambling, alcohol, tobacco, weapons
- ❌ Copyrighted images/text without license
- ❌ Clickbait titles that don't deliver
- ❌ Pages with more ads than content
- ❌ Auto-generated AI content without human review

---

## Technical Setup Checklist

### Required Pages (AdSense Approval)
- [ ] **Privacy Policy** — Must disclose cookies, AdSense, analytics, data retention
- [ ] **Terms of Service** — User obligations, disclaimer, limitation of liability
- [ ] **About / Contact** — Real identity, email, physical address (or "contact form only")
- [ ] **Disclaimer** — "Not professional advice" for YMYL topics

### HTML Structure (Per Template)
- [ ] Semantic HTML5: `<header>`, `<main>`, `<article>`, `<section>`, `<footer>`
- [ ] One `<h1>` per page, proper heading hierarchy (h2 → h3)
- [ ] `meta description` (150-160 chars, unique per page)
- [ ] `alt` text on every image (descriptive, not keyword-stuffed)
- [ ] `rel="noopener noreferrer"` on external links
- [ ] Canonical URL on every page
- [ ] Open Graph + Twitter Card tags for social sharing

### Ad Placement Rules (Policy-Safe)
| Placement | Max Units | Notes |
|-----------|-----------|-------|
| Above fold | 1 | Must not push content below fold on mobile |
| In-content | 3-4 | After intro, mid-article, before conclusion, after FAQ |
| Sidebar | 1 | Desktop only; hide on mobile < 768px |
| Sticky/footer | 1 | Anchor ad (auto) or fixed bottom — must be dismissible |
| **Total** | **5-6** | Auto ads count toward limit; manual = more control |

**Never:**
- Ads inside nav, header, footer (confused with content)
- Ads between list items or table rows
- Pop-ups, interstitials, auto-play video ads
- Ads on 404, thank-you, login, checkout pages
- More than 30% ad density above fold

### Page Speed Targets (Core Web Vitals)
- **LCP** < 2.5s — Optimize images (WebP, proper dimensions), preload hero
- **INP** < 200ms — Minimize main-thread JS, defer non-critical
- **CLS** < 0.1 — Reserve ad slot height, explicit image dimensions
- **Mobile Usability** — Tap targets 48px+, readable text (16px+), no horizontal scroll

### Image Optimization
```html
<!-- Responsive, WebP with fallback, explicit dimensions -->
<picture>
  <source srcset="image-800.webp" type="image/webp" media="(max-width: 800px)">
  <source srcset="image-1200.webp" type="image/webp">
  <img src="image-1200.jpg" alt="Descriptive alt text" width="1200" height="800" loading="lazy">
</picture>
```

---

## Minimal Site Structure

```
adsense-site/
├── index.html              # Homepage: niche intro + 3-5 best articles
├── guides/
│   ├── index.html          # Guide index (category page)
│   ├── guide-1.html        # "Best X for Y"
│   ├── guide-2.html        # Step-by-step tutorial
│   └── guide-3.html        # Data analysis / case study
├── tools/
│   └── calculator.html     # Interactive tool (keeps dwell time high)
├── about.html              # Real person/team, credentials, mission
├── contact.html            # Form (Formspree/Netlify Forms) + email
├── privacy.html            # Required — use Termly or Iubenda generator
├── terms.html              # Required
├── disclaimer.html         # Required for YMYL
├── robots.txt
├── sitemap.xml
├── .htaccess / netlify.toml / vercel.json  # Redirects, headers
├── assets/
│   ├── css/style.css       # Extracted from template (optional)
│   ├── js/main.js          # Minimal: smooth scroll, FAQ toggle
│   └── images/             # WebP, < 100KB each
└── ads.txt                 # After AdSense approval: google.com, pub-XXXX, DIRECT, f08c47fec0942fa0
```

---

## Launch Checklist (Pre-AdSense Application)

### Content (Minimum Viable Site)
- [ ] 15-20 high-quality articles (1500+ words each)
- [ ] 3+ content pillars (categories) with 5+ posts each
- [ ] All YMYL pages have author bio + credentials + disclaimer
- [ ] Original images/charts in >50% of posts
- [ ] Internal linking: 3-5 links per article to related posts
- [ ] No broken links (run `broken-link-checker`)

### Technical
- [ ] HTTPS everywhere (Let's Encrypt / Cloudflare)
- [ ] `robots.txt` allows `/` and `/sitemap.xml`, disallows `/admin`, `/search`
- [ ] `sitemap.xml` submitted to GSC
- [ ] Google Search Console verified + sitemap submitted
- [ ] Google Analytics 4 + Search Console linked
- [ ] Page speed > 90 mobile / 95 desktop (PageSpeed Insights)
- [ ] Mobile-friendly test passes
- [ ] No console errors

### Policy
- [ ] Privacy Policy mentions: Google AdSense, cookies, GA4, data rights (GDPR/CCPA)
- [ ] `ads.txt` not yet needed (only after approval)
- [ ] No placeholder content, no "lorem ipsum", no "coming soon"
- [ ] Site age: ideally 30+ days, but 10+ quality posts can work
- [ ] Traffic: 50-100 organic visits/day helps but not required

---

## Post-Approval Optimization

### Week 1-2: Baseline
- Enable **Auto Ads** (overlay + in-page) — let Google optimize placement
- Add **Manual ads** in 3 proven slots (template has 3)
- Link **AdSense ↔ GA4** for revenue per page data

### Month 1: Test & Iterate
| Test | Method | Metric |
|------|--------|--------|
| Ad density | Remove 1 in-content slot | RPM, CTR, bounce |
| Ad size | Responsive vs fixed 336x280 | Viewability, RPM |
| Anchor ad | On vs off | Session RPM, pages/session |
| Sidebar | Sticky vs static | CTR, earnings |

### Ongoing
- **Top 20 pages by traffic** → optimize ad placement, update content, add internal links
- **Low RPM pages** → check ad visibility, content quality, intent match
- **Seasonal content** → update before peak (tax season, back-to-school, holidays)
- **Content audit quarterly** → merge thin posts, redirect 404s, update dates

---

## Revenue Estimation (Rough)

| Monthly Pageviews | Niche RPM | Estimated Earnings |
|-------------------|-----------|-------------------|
| 10,000 | $8 | $80 |
| 50,000 | $12 | $600 |
| 100,000 | $15 | $1,500 |
| 500,000 | $18 | $9,000 |

**Key levers:** Traffic quality (search intent), niche RPM, ad viewability, pages/session.

---

## Tools to Automate

| Task | Tool | Cost |
|------|------|------|
| Keyword research | Ahrefs / Semrush / LowFruits | $29-129/mo |
| Content optimization | SurferSEO / NeuronWriter | $19-97/mo |
| Site audit | Screaming Frog (free 500 URLs) | Free / £149/yr |
| Speed monitoring | PageSpeed API + Cron | Free |
| Rank tracking | Nightwatch / AccuRanker | $30-100/mo |
| Ad revenue analytics | AdSense + GA4 (free) | Free |
| Backlink monitoring | Ahrefs / SE Ranking | Included above |

---

## Quick Wins Checklist (Do This Week)

- [ ] Pick **one niche** from the high-RPM table above
- [ ] Buy domain (exact-match not needed; brandable > keyword)
- [ ] Deploy template to Netlify/Vercel/Cloudflare Pages (free, HTTPS, CDN)
- [ ] Write 3 pillar articles (use template, 2000+ words each)
- [ ] Create Privacy/Terms/About/Contact (use Termly free tier)
- [ ] Submit to GSC, wait for indexing
- [ ] Write 2 more articles/week until 15+ total
- [ ] Apply to AdSense when checklist above is green

---

## Template Customization Notes

**Replace in `INDEX.html`:**
- `ca-pub-XXXXXXXXXXXXXXXX` → Your AdSense publisher ID (after approval)
- `YOUR_SLOT_1/2/3` → Your ad unit IDs (create in AdSense → Ads → By ad unit)
- `[SITE NAME]`, `[PAGE TITLE]`, `[YOUR NICHE]` → Your brand
- `[DATE]` → ISO date (2024-01-15) for `lastmod` in sitemap
- Colors in `:root` → Your brand (keep contrast AA/AAA)

**Deploy to Netlify (fastest):**
```bash
# 1. Push folder to GitHub
# 2. Netlify → Add new site → Import from Git
# 3. Build command: (empty)  |  Publish directory: .
# 4. Add custom domain → DNS → Done
```

**Netlify headers (`_headers` file):**
```
/*
  X-Frame-Options: DENY
  X-Content-Type-Options: nosniff
  Referrer-Policy: strict-origin-when-cross-origin
  Permissions-Policy: interest-cohort=()
```

**Cloudflare (free tier):** Enable Auto Minify (HTML/CSS/JS), Brotli, Polish (lossless), Rocket Loader (test first).

---

## Red Flags That Get You Banned

1. **Click fraud** — Never click your own ads. Never ask others to.
2. **Traffic buying** — No bot traffic, no paid-to-click, no traffic exchanges.
3. **Policy violations** — 3 strikes = permanent ban. Appeal rarely works.
4. **Invalid traffic** — Monitor AdSense "Invalid traffic" report weekly.
5. **Content shifting** — Don't pivot to prohibited niches after approval.

---

## Resources

- [AdSense Program Policies](https://support.google.com/adsense/answer/48182)
- [Webmaster Quality Guidelines](https://developers.google.com/search/docs/fundamentals/quality-guidelines)
- [Core Web Vitals](https://web.dev/vitals/)
- [AdSense Help Forum](https://support.google.com/adsense/community) — Read before posting
- [Termly Privacy Policy Generator](https://termly.io/) — Free for basic sites