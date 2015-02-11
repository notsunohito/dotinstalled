-- import qualified Data.ByteString.Lazy as B
-- import qualified Data.ByteString as S

-- B.pack [99,97,110]
-- => "can"
--  B.pack [98..120]
-- => "bcdefghijklmnopqrstuvwx"

-- let by = B.pack [98,111,114,116]
-- by
-- => "bort"
-- B.unpack by
-- => [98,111,114,116]

-- B.fromChunks [S.pack [40,41,42], S.pack[43,44,45], S.pack[46,47,48]]
-- => "()*+,-./0"

-- B.cons 85 $ B.pack [80,81,82,84]
-- => "UPQRT"

-- :t S.readFile
-- => S.readFile :: FilePath -> IO S.ByteString


import System.Environment
import System.Directory
import System.IO
import Control.Exception
import qualified Data.ByteString.Lazy as B

main = do
    (fileName1:fileName2:_) <- getArgs
    copy fileName1 fileName2

copy source dest = do
    contents <- B.readFile source
    bracketOnError
        (openTempFile "." "temp")
        (\(tempName, tempHandle) -> do
           hClose tempHandle
           removeFile tempName)
        (\(tempName, tempHandle) -> do
           B.hPutStr tempHandle contents
           hClose tempHandle
           renameFile tempName dest)
