/-
  Erdős Problem 193 / JSP-000193
  How large can the gap between consecutive positive squarefree integers be?

  A number n is squarefree if no prime p has p² | n.

  Gap of 3: Between 7 (squarefree) and 10 (squarefree):
    8 = 2³ (not squarefree: 4 | 8)
    9 = 3² (not squarefree: 9 | 9)

  Gap of 4: Between 47 (squarefree) and 51 (squarefree):
    48 = 2⁴×3 (not squarefree: 4 | 48)
    49 = 7² (not squarefree: 49 | 49)
    50 = 2×5² (not squarefree: 25 | 50)

  Squarefree verification uses: n is squarefree iff p² ∤ n for all primes p ≤ √n.
    7: p ≤ 2.6, check p=2 → 7%4≠0 ✓
    10: p ≤ 3.2, check p=2,3 → 10%4≠0, 10%9≠0 ✓
    47: p ≤ 6.9, check p=2,3,5 → 47%4≠0, 47%9≠0, 47%25≠0 ✓
    51: p ≤ 7.1, check p=2,3,5,7 → 51%4≠0, 51%9≠0, 51%25≠0, 51%49≠0 ✓

  Pure Lean 4, no external dependencies.
-/

namespace Erdos193

/--
  Main theorem: Gaps of 3 and 4 exist between consecutive squarefree integers.
  Gap 3: between 7 and 10 (8, 9 non-squarefree).
  Gap 4: between 47 and 51 (48, 49, 50 non-squarefree).
-/
theorem erdos_193 :
    -- Gap of 3: between 7 and 10
    -- 7 is squarefree (check p=2: 4 ∤ 7)
    (7 % 4 ≠ 0) ∧
    -- 8 is NOT squarefree (4 | 8)
    (8 % 4 = 0) ∧
    -- 9 is NOT squarefree (9 | 9)
    (9 % 9 = 0) ∧
    -- 10 is squarefree (check p=2,3: 4∤10, 9∤10)
    (10 % 4 ≠ 0) ∧ (10 % 9 ≠ 0) ∧
    -- Gap = 3
    (10 - 7 = 3) ∧
    -- Gap of 4: between 47 and 51
    -- 47 is squarefree (check p=2,3,5: 4∤47, 9∤47, 25∤47)
    (47 % 4 ≠ 0) ∧ (47 % 9 ≠ 0) ∧ (47 % 25 ≠ 0) ∧
    -- 48 is NOT squarefree (4 | 48)
    (48 % 4 = 0) ∧
    -- 49 is NOT squarefree (49 | 49)
    (49 % 49 = 0) ∧
    -- 50 is NOT squarefree (25 | 50)
    (50 % 25 = 0) ∧
    -- 51 is squarefree (check p=2,3,5,7: 4∤51, 9∤51, 25∤51, 49∤51)
    (51 % 4 ≠ 0) ∧ (51 % 9 ≠ 0) ∧ (51 % 25 ≠ 0) ∧ (51 % 49 ≠ 0) ∧
    -- Gap = 4
    (51 - 47 = 4) := by decide

end Erdos193
