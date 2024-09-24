use cardano/transaction.{OutputReference, Transaction}
use lucid/types.{LucidDatum, LucidRedeemer}

validator lock {
  spend(
    datum: Option<LucidDatum>,
    redeemer: LucidRedeemer,
    utxo: OutputReference,
    self: Transaction,
  ) {
    when datum is {
      None -> False
      Some(datum) ->
        when datum.password == redeemer.password is {
          True -> True
          False -> False
        }
    }
  }

  else(_) {
    fail
  }
}

fn mock_spend(datum: Option<LucidDatum>, redeemer: LucidRedeemer) -> Bool {
  when datum is {
    None -> False
    Some(datum) ->
      when datum.password == redeemer.password is {
        True -> True
        False -> False
      }
  }
}

test mock_spend_1() {
  mock_spend(datum: None, redeemer: LucidRedeemer { password: "123" }) == False
}

test mock_spend_2() {
  mock_spend(
    datum: Some(LucidDatum { password: "123" }),
    redeemer: LucidRedeemer { password: "123" },
  ) == True
}

test mock_spend_3() {
  mock_spend(
    datum: Some(LucidDatum { password: "1234" }),
    redeemer: LucidRedeemer { password: "123" },
  ) == False
}
