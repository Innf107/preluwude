{- | Functions for operating on lists.

This module treats lists as lazy iterators, rather than full container types, so the functions given here will not unnecessarily materialize lists.
-}
module Preluwude.List where

import Preluwude.Base

-- | Convert from one container type to another by going through an intermediate list.
viaList :: (IsList l1, IsList l2, Item l1 ~ Item l2) => l1 -> l2
viaList = fromList . toList
