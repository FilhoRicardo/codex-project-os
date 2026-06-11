# Aster — Brand & UI System

> A reusable visual language for the tools I build. Calm, **light glassmorphism** with a
> **greyscale base + a single deep forest-green accent** and **monospace for all data**.
> Drop this file (and `aster-tokens.css`) into any project folder so every tool stays consistent.

**Mark:** the asterisk **✲** in a green gradient rounded square. **Wordmark:** "Aster" (rename to your tool's name; keep the mark + system).

---

## How to use this in a new project

1. Copy `aster-tokens.css` into the project and import it; use its CSS variables + utility classes.
2. If an AI assistant (Claude Code, etc.) is building the tool, tell it: **"Follow `BRAND.md` in this folder. Use `aster-tokens.css` tokens; don't invent new colors, fonts, or shadows."**
3. Build screens to **fit the viewport** — only inner lists/editors scroll, the page doesn't.

---

## Principles
1. **One accent.** Greyscale does the work; deep green marks only what's active, selected, primary, or a key number. Never decorate with it.
2. **Glass, not flat.** Surfaces are frosted and layered over a softly tinted backdrop so the blur has something to refract. Light theme only.
3. **Mono is for data.** Dates, times, counts, IDs, week numbers, and eyebrow labels are monospace. Prose/UI is the grotesk sans.
4. **Tight but breathable.** Dense, scannable layouts; generous radii and soft shadows keep it calm.
5. **Quiet motion.** 120–150ms color/background transitions; nothing bounces or slides far.
6. **No slop.** No heavy gradients-as-decoration, no emoji as UI, no neon, no drop-shadow stacks. Earn every element.

## Color
| Role | Token | Hex / value |
|---|---|---|
| Text primary | `--aster-ink` | `#1d2421` |
| Text secondary | `--aster-ink-2` | `#5a615b` |
| Label | `--aster-ink-3` | `#8a928d` |
| Meta / placeholder | `--aster-ink-4` | `#9aa19c` |
| **Accent green** | `--aster-green` | `#13733f` |
| Accent green deepest | `--aster-green-deep` | `#115c34` |
| Accent muted label | `--aster-green-soft` | `#5f9d79` |
| **Button / active gradient** | `--aster-green-grad` | `linear-gradient(180deg,#23a564,#13733f)` |
| Mark / avatar gradient | `--aster-green-mark` | `linear-gradient(150deg,#2bb172,#0f6b3f)` |
| Green tint fill / border | `--aster-green-tint` / `-line` | `rgba(20,120,72,.10)` / `.20` |
| Backdrop | `.aster-bg` | layered green/blue radial tints over `#eef1ef → #e1e7e3` |

**Status (sparingly):** amber `#a9791f`, red `#c2533f`, blue `#3f6fd0`, violet `#5b57b0` — each with a ~10–14% tinted fill. **Data-viz dots:** in-band `#1b8a54`, below `#d8a23c`, above `#e15b4f`, holiday `#5b8def`.

## Typography
- **Sans:** Schibsted Grotesk (400–800) — headings + UI.
- **Mono:** JetBrains Mono (400–700) — dates, numbers, labels, code.
- Scale: page title 28–34/800 (−.02em) · detail title 24–26/800 · big stat (mono) 30–34/700 · body 12.5–13.5/1.55 · eyebrow (mono) 10–11/600, .1–.13em, uppercase, `#8a928d`.

## Surfaces (glass recipe)
```css
background: rgba(255,255,255,0.46);
backdrop-filter: blur(36px) saturate(1.8);            /* cards: blur(32px) */
border: 1px solid rgba(255,255,255,0.55);
box-shadow: inset 0 1px 0 rgba(255,255,255,0.80), 0 14px 40px rgba(20,40,30,0.09);
border-radius: 18px;                                  /* cards 16, rows 11 */
```
Inner (non-blurred) rows: `rgba(255,255,255,.5–.55)` + `1px solid rgba(255,255,255,.6)` + `inset 0 1px 0 rgba(255,255,255,.6)`.

## Spacing & radius
- Spacing: 4 / 8 / 12 / 14 / 18 / 22 px. Panel padding 14–18; gaps 6–14.
- Radius: rows 11 · cards 16 · panels 18 · pills 9 · modals 22.

## Components
- **Primary button:** green gradient, white text, `box-shadow:0 7px 16px rgba(16,96,60,.30)`. **Ghost:** translucent white + hairline. **Green-ghost:** green tint fill + green text.
- **Badge/pill:** mono 9–11px, uppercase, tinted fill matching meaning (priority=violet, done=green, overdue=red, warn=amber).
- **Input/textarea:** translucent white, hairline border, `inset 0 1px 3px rgba(20,40,30,.05)`, placeholder `#9aa19c`.
- **Selected row/card:** green tint fill + `rgba(20,120,72,.42)` border + soft green shadow.
- **Icon rail / nav:** 44×44 buttons, radius 13; active = green gradient fill + white icon + glow; inactive icon `#7b837d`, hover lightens.
- **Avatar / mark:** rounded square (14px) with `--aster-green-mark`, white mono initials.

## Iconography
Simple line icons, ~20px, ~1.7 stroke, `currentColor` (Lucide-style). No filled/duotone, no hand-drawn illustration. Imagery uses **labeled placeholders** until real assets exist.

## Data viz
Bars: rounded tops (`11px 11px 3px 3px`); **green gradient when at/under target, red when over.** Charts get faint dashed gridlines, a tinted **target band** with mono edge labels, and mono axis/value labels. Calendars: week-number column + per-day status dots in the palette above; today/selected = green tint + border.

## Voice
Plain, competent, lightly systems-flavored ("Mission control", "Task horizon", "In band"). Mono for any literal value. No exclamation marks, no hype.

## Do / Don't
- ✅ Greyscale + one green · ✅ frosted layered panels · ✅ mono for data · ✅ fit-to-viewport
- ❌ second accent or neon green · ❌ flat opaque cards (kills the glass) · ❌ Inter/Roboto/Arial · ❌ emoji as UI · ❌ decorative gradients · ❌ page-level scrolling

## Files
- `aster-tokens.css` — variables + utility classes (`.aster-bg`, `.aster-glass`, `.aster-glass--card`, `.aster-inner`, `.aster-eyebrow`, `.aster-btn`, `.aster-badge`, `.aster-input`, `.aster-selected`).
