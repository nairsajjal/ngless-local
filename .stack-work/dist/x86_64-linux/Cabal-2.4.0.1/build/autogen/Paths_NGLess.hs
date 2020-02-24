{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_NGLess (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,1,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/sajjal/Desktop/ngless-local/.stack-work/install/x86_64-linux/lts-14.20/8.6.5/bin"
libdir     = "/home/sajjal/Desktop/ngless-local/.stack-work/install/x86_64-linux/lts-14.20/8.6.5/lib/x86_64-linux-ghc-8.6.5/NGLess-1.1.0-965Np14lOUvJ2rS9XGhph5"
dynlibdir  = "/home/sajjal/Desktop/ngless-local/.stack-work/install/x86_64-linux/lts-14.20/8.6.5/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/sajjal/Desktop/ngless-local/.stack-work/install/x86_64-linux/lts-14.20/8.6.5/share/x86_64-linux-ghc-8.6.5/NGLess-1.1.0"
libexecdir = "/home/sajjal/Desktop/ngless-local/.stack-work/install/x86_64-linux/lts-14.20/8.6.5/libexec/x86_64-linux-ghc-8.6.5/NGLess-1.1.0"
sysconfdir = "/home/sajjal/Desktop/ngless-local/.stack-work/install/x86_64-linux/lts-14.20/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "NGLess_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "NGLess_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "NGLess_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "NGLess_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "NGLess_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "NGLess_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
