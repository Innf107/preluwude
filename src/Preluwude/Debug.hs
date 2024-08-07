module Preluwude.Debug (assertM) where

import Preluwude.Base

import GHC.Stack (withFrozenCallStack)

assertM :: (HasCallStack, Applicative f) => Bool -> f ()
assertM condition = withFrozenCallStack (assert condition (pure ()))
