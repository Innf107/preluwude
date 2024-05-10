{- | Overrides of common functions.

These are mostly either partial alternatives of prelude functions or functions
on lists or strings that are extended to generic @Foldable@s or @Text@ respectively.
-}
module Preluwude.Overrides (
    map,
    maximumMaybe,
    minimumMaybe,
    error,
) where

import Preluwude.Base
import Preluwude.String

import Prelude qualified


-- | Alias for 'fmap' that doesn't give linked lists any special privileges
map :: (Functor f) => (a -> b) -> f a -> f b
map = fmap

{- | Find the largest element in a container or 'Nothing' if the container is empty.
This is a safe alternative to 'Prelude.maximum'.

Alternatively, consider using 'maximum' on types that implement 'Foldable1'.
-}
maximumMaybe :: (Foldable f, Ord a) => f a -> Maybe a
maximumMaybe f
    | null f = Nothing
    | otherwise = Just (Prelude.maximum f)

{- | Find the smallest element in a container or 'Nothing' if the container is empty.
This is a safe alternative to 'Prelude.minimum'.

Alternatively, consider using 'minimum' on types that implement 'Foldable1'.
-}
minimumMaybe :: (Foldable f, Ord a) => f a -> Maybe a
minimumMaybe f
    | null f = Nothing
    | otherwise = Just (Prelude.minimum f)

error :: ToString s => s -> a
error x = Prelude.error (toString x)

