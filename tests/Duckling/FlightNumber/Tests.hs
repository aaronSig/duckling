-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree. An additional grant
-- of patent rights can be found in the PATENTS file in the same directory.


{-# LANGUAGE OverloadedStrings #-}

module Duckling.FlightNumber.Tests
  ( tests
  ) where

import Data.String
import Prelude
import Test.Tasty
import Test.Tasty.HUnit

import Duckling.Dimensions.Types
import Duckling.Testing.Asserts
import Duckling.Testing.Types
import Duckling.FlightNumber.Corpus
import Duckling.FlightNumber.Types

tests :: TestTree
tests = testGroup "FlightNumber Tests"
  [ makeCorpusTest [This FlightNumber] corpus
  , makeNegativeCorpusTest [This FlightNumber] negativeCorpus
  ]