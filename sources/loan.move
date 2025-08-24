module trustloop::loan {
    use std::vector;
    use sui::tx_context::{TxContext};
    use sui::object::{Self, UID};

    struct Loan has key {
        id: UID,
        borrower: address,
        amount: u64,
        funded: bool,
        repaid: bool,
    }

    /// Crea un nuovo prestito
    public entry fun create_loan(borrower: address, amount: u64, ctx: &mut TxContext): Loan {
        Loan {
            id: object::new(ctx),
            borrower,
            amount,
            funded: false,
            repaid: false,
        }
    }
}
