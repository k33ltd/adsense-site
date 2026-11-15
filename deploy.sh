#!/usr/bin/env bash
# deploy.sh — Push to GitHub + deploy to Netlify
# Usage: ./deploy.sh "commit message"

set -euo pipefail

MSG="${1:-Update content $(date '+%Y-%m-%d %H:%M')}"

echo "🔍 Pre-deploy checks..."

# 1. Validate HTML (basic)
echo "  → Checking HTML syntax..."
if command -v htmlhint >/dev/null 2>&1; then
  htmlhint *.html guides/*.html tools/*.html 2>/dev/null || true
else
  echo "    (htmlhint not installed, skipping)"
fi

# 2. Check for placeholder content
echo "  → Scanning for placeholders..."
PLACEHOLDERS=$(grep -r "YOUR-DOMAIN\|ca-pub-XXXXXXXXXXXXXXXX\|YOUR_SLOT_\|\[PAGE TITLE\]\|\[SITE NAME\]" --include="*.html" --include="*.xml" . 2>/dev/null | head -20)
if [[ -n "$PLACEHOLDERS" ]]; then
  echo "  ⚠️  Found placeholders that need replacement:"
  echo "$PLACEHOLDERS"
  echo ""
  read -p "Continue anyway? (y/N) " -n 1 -r
  echo
  [[ $REPLY =~ ^[Yy]$ ]] || exit 1
fi

# 3. Check for required files
REQUIRED=(robots.txt sitemap.xml netlify.toml INDEX.html privacy.html terms.html about.html contact.html disclaimer.html)
for f in "${REQUIRED[@]}"; do
  [[ -f "$f" ]] || { echo "  ❌ Missing required file: $f"; exit 1; }
done
echo "  ✅ All required files present"

# 4. Git status
echo "  → Git status:"
git status --short

# 5. Commit & push
echo "  → Committing..."
git add -A
git commit -m "$MSG" || echo "  (nothing to commit)"

echo "  → Pushing to origin..."
git push origin main

# 6. Netlify deploy (if CLI installed)
if command -v netlify >/dev/null 2>&1; then
  echo "  → Triggering Netlify deploy..."
  netlify deploy --prod --dir=. --message="$MSG"
else
  echo "  ℹ️  Netlify CLI not installed. Deploy triggers automatically on git push."
  echo "     Install: npm i -g netlify-cli"
fi

echo ""
echo "✅ Deploy complete!"
echo "   Check: https://app.netlify.com/sites/YOUR-SITE/deploys"
echo "   Live:  https://YOUR-DOMAIN.com"