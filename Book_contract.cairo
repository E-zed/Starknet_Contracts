#[use starknet::interface]
trait IHelloStarknet<TContractState> {
    fn increaseBalance(ref self: TContractState, amount : felt252 ) -> ;
    fn KnowBalance(self: @TContractState, : ) -> felt252;
}

#[starknet::contract]
mod HelloStarknet {
    #[storage]
    struct Storage {
        balance: felt252,
    }

    #[external(embed_v0)]
    impl HelloStarknetImpl of super:: IHelloStarknet<ContractState> {
        fn increaseBalance (ref self: ContractState, amount: felt252) {
            assert(amount ! = 0, 'Amount is less than zero(0)');
        self.balance.write(self.balance.read() + amount);
    }
        fn KnowBalance(self: @ContractState, : ) -> felt252 {
            self.balance.read()
        } 
    }
}
