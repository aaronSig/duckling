-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree. An additional grant
-- of patent rights can be found in the PATENTS file in the same directory.


{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

module Duckling.FlightNumber.Types where

import Control.DeepSeq
import Data.Aeson
import Data.Hashable
import Data.Maybe
import Data.Text (Text)
import GHC.Generics
import Prelude

import Duckling.Resolve (Resolve(..))

data FlightNumberData = FlightNumberData
  { airlineIata :: Text
  , number :: Text
  }
  deriving (Eq, Generic, Hashable, Ord, Show, NFData)

instance Resolve FlightNumberData where
  type ResolvedValue FlightNumberData = FlightNumberData
  resolve _ _ x = Just (x, False)

instance ToJSON FlightNumberData where
  toJSON (FlightNumberData airlineIata number) = object
    [ "airline_iata"  .= airlineIata
    , "flight_number" .= number
    ]
