module Preluwude.Cons where

import Preluwude.Base

import Data.Sequence qualified as Seq
import Data.Text qualified as Text
import Data.Vector qualified as Vector

{- | 'Cons' is a type class for types that support an /efficient/ append operation to the front,
such as 'Vector's, 'List's or 'Seq's.

Types that implement 'Cons' don't necessarily need to implement 'UnCons', although in practice most will.
-}
class Cons t a | t -> a where
    -- | Append an element to the front of a container
    (<|) :: a -> t -> t

{- | 'UnCons' is a type class for types that support efficiently taking the first element apart, such as 'List's, 'Seq's or 'Vector's.
    TODO
-}
class UnCons t a | t -> a where
    uncons :: t -> Maybe (a, t)

-- | TODO
pattern (:<|) :: (UnCons t a) => () => a -> t -> t
pattern x :<| xs <- (uncons -> Just (x, xs))

-- | TODO
class Snoc t a | t -> a where
    (|>) :: t -> a -> t

-- | TODO
class UnSnoc t a | t -> a where
    unsnoc :: t -> Maybe (t, a)

-- | TODO
pattern (:|>) :: (UnSnoc t a) => () => t -> a -> t
pattern xs :|> x <- (unsnoc -> Just (xs, x))

{- | 'Empty' is a class for container types that have an empty value.

If this type also implements Foldable or IsList, it should satisfy the following laws.

> isEmpty = null
> empty = fromList []

If this type implements 'UnCons' or 'UnSnoc', @{'Empty', '(:|>)'}@, as well as @{'Empty', '(:<|)'}@ __need__ to be exhaustive pattern sets
and the following laws should hold:

> isEmpty x = isNothing (uncons x)
> isEmpty x = isNothing (unsnoc x)

-}
class Empty t where
    isEmpty :: t -> Bool
    empty :: t

-- | TODO
pattern Empty :: (Empty t) => t
pattern Empty <- (isEmpty -> True)
    where
        Empty = empty

{-# COMPLETE Empty, (:|>) #-}
{-# COMPLETE Empty, (:<|) #-}

instance Cons (List a) a where
    (<|) = (:)
instance UnCons (List a) a where
    uncons (x : xs) = Just (x, xs)
    uncons [] = Nothing
instance Empty (List a) where
    isEmpty [] = True
    isEmpty _ = False
    empty = []

instance UnCons (Vector a) a where
    uncons = Vector.uncons
instance UnSnoc (Vector a) a where
    unsnoc = Vector.unsnoc
instance Empty (Vector a) where
    isEmpty = Vector.null
    empty = Vector.empty

instance Cons (Seq a) a where
    (<|) = (Seq.<|)
instance UnCons (Seq a) a where
    uncons (x Seq.:<| xs) = Just (x, xs)
    uncons _ = Nothing
instance Snoc (Seq a) a where
    (|>) = (Seq.|>)
instance UnSnoc (Seq a) a where
    unsnoc (xs Seq.:|> x) = Just (xs, x)
    unsnoc _ = Nothing
instance Empty (Seq a) where
    isEmpty = Seq.null
    empty = Seq.Empty

instance UnCons Text Char where
    uncons = Text.uncons
