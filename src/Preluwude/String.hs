{- | Conversions to and from strings inspired by Relude's ToString type class.

These should mostly be used at application boundaries with the core program working exclusively with 'Text'.
-}
module Preluwude.String (ToString (..), ToText (..), IsString (..)) where

import Preluwude.Base

import Data.Text qualified as Text

class ToString s where
    toString :: s -> String

class ToText s where
    toText :: s -> Text

instance ToString String where
    toString = id
instance ToString Text where
    toString = Text.unpack

instance ToText Text where
    toText = id
instance ToText String where
    toText = Text.pack
