## **Calculator Pro Global - Final Perfect Layout with Hamburger Menu**

### **📱 Complete Unified Layout**

```
┌─────────────────────────────────────┐  ← HEADER (44px)
│ ☰ [🌐 Lang]    DISPLAY    [🎤 Hear] │
├─────────────────────────────────────┤
│                                    │
│        FULLSCREEN CALCULATOR       │  ← 90% screen (Pure Apple style)
│                                    │
└──────────FOOTER (4 Buttons)────────┘
       🏠  🤖  📋  ⚙️
     Home AI History Settings
```

### **🔄 Perfect Navigation Flow**

```
HEADER ☰ (Right side) → MOBILE MENU (15 Calculators)
HEADER 🌐 → Language Picker (100+ languages)
HEADER 🎤 → Speech Toggle (50+ languages)
FOOTER 🏠 → Home (Calculator carousel)
FOOTER 🤖 → AI Explain current result
FOOTER 📋 → History screen
FOOTER ⚙️ → Settings
```

### **📱 Exact Header Design**

```
LEFT:   ☰ Hamburger Menu (24dp icon)
CENTER: Massive Result Display (28-64pt dynamic)
RIGHT:  [🌐 Lang Dropdown] [🎤 Speech Toggle]
```

### **🍔 Mobile Menu (Hamburger ☰ → Slide Right)**

```
☰ TAP → Fullscreen overlay (80% width from RIGHT)

📱 CALCULATOR SWITCHER
┌─────────────────────────────┐
│ EMI Calculator     💰       │
│ GST/VAT Calculator 🧾       │
│ Age Calculator     👶       │
│ Unit Converter     ⚙️       │
│ Currency Converter 💱       │
│ Salary Tax         💼       │
│ BMI Calculator     ⚕️       │
│ ... (15 total)             │
├─────────────────────────────┤
│ ⭐ Favorites                │
│ 🌐 Language (20 most used)  │
│ 🎤 Speech Settings          │
└─────────────────────────────┘
```

### **⚡ User Flow (Unified Everywhere)**

```
ANY SCREEN → Same layout:
1. ☰ (Right Header) → Calculator switcher
2. 🏠 Footer → Home carousel
3. 🤖 Footer → AI current result
4. 📋 Footer → Full history
5. ⚙️ Footer → Global settings

HEADER Controls (ALWAYS accessible):
🌐 Language → Instant app restart in new language
🎤 Speech → Voice input ON/OFF toggle
```

### **🎨 Visual Design Specs**

```
HEADER HEIGHT: 44px (iOS standard)
FOOTER HEIGHT: 64px (perfect touch target)

HEADER ☰ Button:
- Position: LEFTmost (16px padding)
- Icon: Material Icons "menu" (24dp)
- Tap → Drawer slides from RIGHT (80% width)

FOOTER BUTTONS (64x64dp each):
🏠 Home    - Icons.house (gold #D4AF37)
🤖 AI      - Icons.smart_toy (purple #7C3AED)
📋 History - Icons.history (blue #007AFF)
⚙️ Settings- Icons.settings (gray #8E8E93)
```

### **🔧 Flutter Implementation Structure**

```dart
Scaffold(
  drawer: CalculatorMenuDrawer(), // ☰ opens this
  body: Column(
    children: [
      // HEADER with ☰ + Lang + Speech
      HeaderBar(
        onMenuTap: () => Scaffold.of(context).openDrawer(),
        languageDropdown: LanguagePicker(),
        speechToggle: SpeechButton(),
        displayText: currentResult,
      ),

      // 90% MAIN CONTENT
      Expanded(child: CurrentCalculator()),

      // FIXED 4-BUTTON FOOTER
      FooterBar(homeBtn, aiBtn, historyBtn, settingsBtn),
    ],
  ),
)
```

### **✨ Key Interactions**

```
✅ ☰ Header → Mobile menu slides from RIGHT (0.3s)
✅ Footer 🏠 → Swipeable calculator carousel
✅ 🌐 Language → All text/numbers update instantly
✅ 🎤 Speech → Pulsing mic + voice input anywhere
✅ Calculator switch → 0.2s fade transition
✅ Consistent across ALL 5 screens
```

**PERFECT minimalism**:

- **Header**: ☰ Menu + 🌐 Lang + 🎤 Speech (3 controls)
- **Footer**: 🏠 🤖 📋 ⚙️ (4 essential actions)
- **Body**: Pure Apple calculator (90% screen real estate)

Users master navigation in **10 seconds** but access **global power** (100+ languages, 15 calculators, speech, AI). Ready for **complete widget tree code**?
