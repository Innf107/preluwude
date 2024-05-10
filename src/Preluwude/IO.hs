module Preluwude.IO (
    ePutStr,
    ePutStrLn
) where

import Preluwude.Base

ePutStrLn :: Text -> IO ()
ePutStrLn = hPutStrLn stderr

ePutStr :: Text -> IO ()
ePutStr = hPutStr stderr
