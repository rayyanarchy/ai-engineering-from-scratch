# 01 · Linear Algebra Intuition

> Every AI model is matrix math. Two operations do almost all the work:
> **dot products** (measure alignment) and **matrix multiplies** (transform vectors).

## Definitions

| Term | One-liner |
|------|-----------|
| Vector | A list of numbers = a point (and a direction) in n-dimensional space. |
| Matrix | A transformation: vector in → different vector out (rotate, stretch, squash, change dimension). |
| Dot product | `a · b = a₁b₁ + a₂b₂ + … + aₙbₙ`. Measures how aligned two vectors are. |
| Magnitude | Length of a vector: `|a| = √(a · a) = √(a₁² + … + aₙ²)`. |
| Cosine similarity | Dot product with magnitude removed: `cos θ = (a · b) / (|a| |b|)`. Ranges -1 to 1. |
| Embedding | A vector that encodes the *meaning* of something (word, doc, image, user). |

## Key ideas

- **Vectors in AI:** a word/doc → ~768 numbers (embedding); an image → pixel values; a user → preferences.
- **Matrices in AI:** a neural network layer's weights *are* a matrix. Each layer = one transformation.
- **Dot product sign:**
  - `> 0` → same direction (similar)
  - `= 0` → perpendicular (unrelated)
  - `< 0` → opposite (dissimilar)
- **Two formulas for the same dot product:**
  - Algebraic: `a · b = Σ aᵢbᵢ`
  - Geometric: `a · b = |a| |b| cos θ`, i.e. alignment (cos θ) scaled by both lengths.
- **Dot product vs cosine:** the raw dot product grows with vector length; cosine only cares
  about direction. Many embedding models output unit-length vectors (|v| = 1), in which case
  dot product = cosine similarity, and that's why vector DBs can just use the dot product.

## Why semantic search beats keyword search

"how do I get my money back?" and "Returns and reimbursements" share zero keywords, so
`grep` misses it. But an embedding model places texts with similar *meaning* pointing in
similar *directions*, so their dot product (cosine) is high and RAG ranks the doc first.
This is the retrieval step in every agent's memory / RAG pipeline.
