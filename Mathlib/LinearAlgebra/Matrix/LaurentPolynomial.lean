/-
Copyright (c) 2026 Jeromie N. Beasley. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Jeromie N. Beasley
-/
module

public import Mathlib.Algebra.Polynomial.Laurent
public import Mathlib.LinearAlgebra.Matrix.Determinant.Basic

/-!
# Matrices over Laurent polynomials

This file gives degree bounds for determinants of matrices over Laurent polynomial rings.

## Main results

* `LaurentPolynomial.degree_det_le_sum_columns`: if every entry in column `j` has degree at most
  `d j`, then the determinant has degree at most the sum of the column bounds.
-/

@[expose] public section

open Matrix
open scoped BigOperators

namespace LaurentPolynomial

variable {n R : Type*} [Fintype n] [DecidableEq n] [CommRing R]

/-- If every entry in column `j` of a Laurent-polynomial matrix has degree at most `d j`,
then the determinant has degree at most the sum of the column bounds. -/
theorem degree_det_le_sum_columns (M : Matrix n n (LaurentPolynomial R)) (d : n → ℤ)
    (hM : ∀ i j, degree (M i j) ≤ d j) :
    degree M.det ≤ (∑ j, d j : ℤ) := by
  classical
  rw [Matrix.det_apply']
  have hprod (σ : Equiv.Perm n) :
      degree (∏ i, M (σ i) i) ≤ (∑ i, d i : ℤ) := by
    have h :=
      AddMonoidAlgebra.supDegree_prod_le
        (R := R) (A := ℤ) (B := WithBot ℤ)
        (D := fun z : ℤ => (z : WithBot ℤ))
        (s := Finset.univ) (f := fun i => M (σ i) i) (by simp) (by simp)
    have h' :
        degree (∏ i, M (σ i) i) ≤ ∑ i, degree (M (σ i) i) := by
      simpa [degree, Finset.max_eq_sup_withBot] using h
    exact h'.trans <| by
      have hsum :
          (∑ i in Finset.univ, degree (M (σ i) i)) ≤
            ∑ i in Finset.univ, (d i : WithBot ℤ) :=
        Finset.sum_le_sum fun i _ => hM (σ i) i
      simpa only [Finset.sum_const_zero, WithBot.coe_sum] using hsum
  have hterm (σ : Equiv.Perm n) :
      degree
          (((Equiv.Perm.sign σ : ℤ) : LaurentPolynomial R) *
            ∏ i, M (σ i) i) ≤
        (∑ i, d i : ℤ) := by
    have hs : degree (((Equiv.Perm.sign σ : ℤ) : LaurentPolynomial R)) ≤ 0 := by
      simpa using degree_C_le (((Equiv.Perm.sign σ : ℤ) : R))
    exact (degree_mul_le _ _).trans <| by
      simpa using add_le_add hs (hprod σ)
  induction Finset.univ using Finset.induction_on with
  | empty => simp
  | @insert σ s hσ ih =>
      rw [Finset.sum_insert hσ]
      exact (degree_add_le _ _).trans (max_le (hterm σ) ih)

end LaurentPolynomial
