-- | Re-exports from base and other libraries without any custom classes or functions
module Preluwude.Base (module Export) where

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
    unlines,
    unwords,
    writeFile,
    zip,
    zip3,
    zipWith,
    zipWith3,
    (!!),
    (++),
    (||),
    (&&),
    not,
    undefined
 )

import Data.ByteString as Export (ByteString)
import Data.Foldable1 as Export
import Data.Int as Export
import Data.Kind as Export
import Data.Maybe as Export (isJust, isNothing, fromMaybe)
import Data.Sequence as Export (Seq)
import Data.Text as Export (Text)
import Data.Vector as Export (Vector)
import Data.Word as Export
import GHC.Generics as Export (Generic, Generic1, Generically, Generically1)
import Witherable as Export

import Data.ByteString as Export (
    appendFile,
    readFile,
    writeFile,
 )
import Data.Text.IO as Export (
    hPutStr,
    hPutStrLn,
    putStr,
    putStrLn,
 )
import GHC.Exts as Export (
    IsList (..),
    IsString (..),
    List,
 )
import System.IO as Export (
    Handle,
    stderr,
    stdin,
    stdout,
 )
import GHC.Stack as Export (HasCallStack)
