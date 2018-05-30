-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree. An additional grant
-- of patent rights can be found in the PATENTS file in the same directory.


{-# LANGUAGE OverloadedStrings #-}

module Duckling.FlightNumber.Corpus
  ( corpus
  , negativeCorpus
  ) where

import Data.String
import Prelude

import Duckling.Testing.Types
import Duckling.FlightNumber.Types

corpus :: Corpus
corpus = (testContext, testOptions, allExamples)

negativeCorpus :: NegativeCorpus
negativeCorpus = (testContext, testOptions, examples)
  where
    examples =
      [ "Lets goto23B Session Street"
      , "12345"
      , "2b Loughton Street"
      ]

allExamples :: [Example]
allExamples = concat
  [ examples (FlightNumberData "FR" "103")
             [ "FR103"
             , "FR 103"
             ]
  , examples (FlightNumberData "AI" "9032")
             [ "AI9032"
             , "AI 9032"
             ]
  , examples (FlightNumberData "EY" "1290")
             [ "EY 1290"
             ]
  ]
