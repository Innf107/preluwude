-- | Re-exports from base and other libraries without any custom classes or functions
module Preluwude.Base (module Export, List) where

import Prelude as Export hiding (
    -- TODO: provide some generic alternatives to take, drop, dropWhile, span, break
    -- TODO: add a generic n-ary zip/unzip class
    -- TODO: do something about read
    -- TODO: add convertUtf8 things like in relude
    -- TODO: add maps and a generic Static-/DynamicMap class like in relude
    -- TODO: add unordered-containers
    -- TODO: add LByteString and LText
    -- TODO: add MTL
    appendFile,
    break,
    concat,
    concatMap,
    drop,
    dropWhile,
    error,
    errorWithoutStackTrace,
    filter,
    foldl1,
    foldr1,
    head,
    init,
    last,
    lookup, -- there's no shot i'm letting association lists in here lol
    map,
    maximum,
    minimum,
    putStr,
    putStrLn,
    readFile,
    readIO,
    readLn,
    replicate,
    reverse,
    show,
    span,
    tail,
    take,
    undefined,
    unlines,
    unwords,
    writeFile,
    zip,
    zip3,
    zipWith,
    zipWith3,
    (!!),
    (++),
 )

import Control.Exception as Export (assert)
import Data.ByteString as Export (
    ByteString,
    appendFile,
    readFile,
    writeFile,
 )
import Data.Foldable1 as Export
import Data.Int as Export
import Data.Kind as Export
import Data.Maybe as Export (fromMaybe, isJust, isNothing)
import Data.Sequence as Export (Seq)
import Data.Text as Export (Text)
import Data.Traversable as Export (for)
import Data.Vector as Export (Vector)
import Data.Word as Export
import GHC.Generics as Export (Generic, Generic1, Generically(..), Generically1(..))
import Witherable as Export

-- TODO: Provide a generic interface for maps and sets
import Data.Map as Export (Map, insert, lookup)
import Data.Text.IO as Export (
    hPutStr,
    hPutStrLn,
    putStr,
    putStrLn,
 )
import GHC.Exts as Export (
    IsList (..),
    IsString (..),
 )
import GHC.Stack as Export (HasCallStack)
import System.IO as Export (
    Handle,
    stderr,
    stdin,
    stdout,
 )

import Control.Monad.Except as Export (ExceptT, MonadError (..), runExceptT)
import Control.Monad.IO.Class as Export (MonadIO (..))
import Control.Monad.Reader as Export (MonadReader (..), ReaderT, runReaderT)
import Control.Monad.State.Strict as Export (MonadState (..), StateT, evalStateT, execStateT, runStateT)
import Control.Monad.Trans.Writer.CPS as Export (WriterT, runWriterT)
import Control.Monad.Writer.CPS as Export (MonadWriter (..))

-- This alias is part of GHC.Exts in recent versions of base
-- but we need to define it manually to support older GHC versions
type List = []
