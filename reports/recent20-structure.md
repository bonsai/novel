# Recent 20 Repository Structure

Snapshot: 2026-09-04
Selection: `user:bonsai sort:updated`

## Structural view

The latest 20 repositories are treated as an organization of capabilities rather than a flat repository list.

```text
                         bonsai
                           │
                ┌──────────┴──────────┐
                │                     │
          intelligence              company
                │                     │
              think                   │
                │                     │
           archimedes ───────→ aw.tui
                │                  │
                ↓                  ↓
             repos ───────────→ soubi
                │
       ┌────────┼─────────┐
       ↓        ↓         ↓
    memory   knowledge  capability
    recap    idol-lab   my-skills
    latest   books      hermes-skills
       │        │
       │        ↓
       │    idol-quiz
       │
       └──────────────→ products
                         voice-bbs-web
                         GAME
```

## Layers

### 1. Cognition
- `bonsai/intelligence` — ontology: what intelligence is
- `bonsai/think` — methods: how to think

### 2. Control / Agents
- `bonsai/archimedes` — architect / direction
- `bonsai/aw.tui` — workflow orchestration and organizational view

### 3. Memory / Observatory
- `bonsai/repos` — repository and coding-asset memory
- `bonsai/recap.json` — machine-readable session memory
- `bonsai/latest` — current/latest pointer

### 4. Knowledge
- `bonsai/Programming-Books` — corpus
- `bonsai/idol-lab` — domain research

### 5. Capability
- `bonsai/my-skills` — reusable skills
- `bonsai/hermes-skills` — Hermes skills
- `bonsai/stock-bqml` — data/ML capability

### 6. Product / Application
- `bonsai/voice-bbs-web`
- `bonsai/idol-quiz`
- `bonsai/GAME`

### 7. Identity / Organization
- `bonsai/bonsai` — portfolio/profile
- `bonsai/bons.ai` — identity/entry point
- `bonsai/rooom` — shared workspace
- `bonsai/hoipoi` — experimental space

## Key observation

The repository graph is already behaving like an agent company:

```text
Intelligence → Method → Agent → Memory/Knowledge → Decision → Workflow → Product
```

Therefore `bonsai.company` should be modeled as the **organization graph over repositories**, not as another monolithic application.

Filesystem is storage.
Metadata is memory.
Search is access.
Ontology is meaning.
BQML is discovery.
Think is method.
Company is organization.
Agent is agency.
