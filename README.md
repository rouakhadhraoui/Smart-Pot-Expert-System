# 🌿 Smart-Pot - Plant Management Expert System

An expert system developed in Prolog for identification, analysis, and diagnosis of indoor plants.

 
**Language:** Prolog (SWI-Prolog 9.x)  


---

##  Overview

Smart-Pot is an expert system based on inference rules that allows you to:
- Automatically identify plant types based on their characteristics
- Recommend optimal watering frequencies
- Diagnose plant health issues
- Provide tailored precautionary advice

---

##  Architecture
```
SMART-POT/
├── kb/                         # Knowledge base
│   ├── facts.pl               # Facts (characteristics)
│   ├── rules.pl               # Inference rules (15 rules)
│   ├── plantes.pl             # Plant database
│   └── knowledge_loader.pl    # Loader
├── src/                       # Source code
│   ├── inference_engine.pl    # Inference engine
│   ├── smartpot_cli.pl        # CLI interface
│   └── utils.pl               # Utilities
└── tests/                     # Automated tests
    ├── example_inputs.pl
    └── test_queries.txt
```

---

##  Installation & Launch

### Prerequisites

# SWI-Prolog 9.x or higher
# Installation: https://www.swi-prolog.org/download/stable
```


##  Usage

### CLI Interface

=== MAIN MENU ===
1. Analyze an existing plant
2. Identify an unknown plant
3. Diagnose a health problem
4. List all plants
5. Quit
```


##  Knowledge Base

### Plant classes (5)
| Class | Main criteria | Watering |
|-------|---------------|----------|
| Succulent | Thick leaves, draining soil | 2×/month |
| Tropical | Thin leaves, high humidity | 1×/week |
| Cactus | Round shape, small size | 1×/month |
| Orchid | Flowers, low light | Variable |
| Herbaceous | Medium leaves, medium light | 2×/week |

### Inference rules (15)
- **R1-R5**: Classification by plant type
- **R6-R10**: Watering frequency determination
- **R11-R15**: Identification of necessary precautions

### Available diagnostics
- Overwatering (soft leaves)
- Underwatering (dry leaves)
- Fungal problem (spotted leaves)
- Repotting needed (visible roots)
- Root rot (brown stem)

---

##  Testing
cd tests
swipl

?- [example_inputs].
?- lancer_tous_tests.



## 📄 License

MIT License - Free to use and modify

---
