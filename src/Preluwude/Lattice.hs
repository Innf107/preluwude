module Preluwude.Lattice (
  Lattice(..),
  (-*),
  (</),
  Predicate(..)
) where

import qualified Prelude as P
import Prelude hiding ((||), (&&), not)

{-|
class of types that you can perform boolean operations on
technically a complemented distributive, but haskell calls endofunctors on @Hask@ just @Functor@s so i think its only fair if we get to abuse terminology too

/Associativity/
@
(p || q) || r = @p || (q || r)
(p && q) && r@ = @p && (q && r)
@

/Commutativity/
@
p || q = q || p
p && q = q && p
@

/Unitality/
@
fromBool False || p = p
fromBool True && p = p
@

/Distributivity/
@
p || (q && r) = (p || q) && (p || r)
p && (q || r) = (p && q) || (p && r)
@

/Absorption/
@
p || (p && q) = p
p && (p || q) = p
@

/Complementation/
@
p || not p = fromBool True
p && not p = fromBool False
@
-}
class Lattice a where
  -- |disjunction, read "either @p@ or @q@"
  (||) :: a -> a -> a
  infixr 2 ||
  
  -- |conjunction, read "both @p@ and @q@"
  (&&) :: a -> a -> a
  infixr 3 &&

  -- |initialization
  fromBool :: Bool -> a

  -- |complementation
  not :: a -> a

  -- |equality / xnor, read "@p@ is equal to @q@"
  -- definition is inefficient, so we allow it to be re-implemented, provided the behaviour is identical
  (===) :: Lattice a => a -> a -> a
  p === q = (p -* q) && (q -* p)

  -- |inequality / xor, read "@p@ does not equal @q@"
  -- ditto
  (=/=) :: Lattice a => a -> a -> a
  p =/= q = (p </ q) || (q </ p)

instance Lattice Bool where
  (||) = (P.||)
  (&&) = (P.&&)
  fromBool = id
  not = P.not
  (===) = (==)
  (=/=) = (/=)

-- |implication, read "@p@ implies @q@"
(-*) :: Lattice a => a -> a -> a
p -* q = not p || q
infixr 2 -*

-- |exclusion, read "@p@ without @q@"
(</) :: Lattice a => a -> a -> a
p </ q = p && not q
infixl 3 </

-- we allow `b` to be an arbitrary @Lattice@ so that curried predicates `a -> b -> Bool` work
instance Lattice b => Lattice (a -> b) where
  p || q = \a -> p a || q a
  p && q = \a -> p a && q a
  fromBool p _ = fromBool p
  not p = not . p
  p === q = \a -> p a === q a
  p =/= q = \a -> p a =/= q a

newtype Predicate a = Predicate { test :: a -> Bool }

instance Lattice (Predicate a) where
  p || q = Predicate $ test p || test q
  p && q = Predicate $ test p && test q
  fromBool p = Predicate $ \_ -> fromBool p
  not p = Predicate $ not . test p
  p === q = Predicate $ test p === test q
  p =/= q = Predicate $ test p =/= test q
