-- | Re-exports from base and other libraries without any custom classes or functions
module Preluwude.Base (module Export) where

import Prelude as Export hiding (
    foldl1,
    foldr1,
    head,
    last,
    map,
    maximum,
    minimum,
    error,
    errorWithoutStackTrace
 )

import Data.Foldable1 as Export
import Data.Maybe as Export (isJust, isNothing)
import Data.Sequence as Export (Seq)
import Data.Text as Export (Text)
import Data.Vector as Export (Vector)
import GHC.Exts as Export (
    IsList (..),
    IsString (..),
    List,
 )