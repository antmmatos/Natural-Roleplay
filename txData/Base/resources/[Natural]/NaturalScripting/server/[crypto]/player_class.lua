function CreatePlayer(userData)
    local self = {}

    self.identifier = userData.identifier
    self.name = userData.name
    self.source = userData.source
    self.Admin = userData.isAdmin
    self.CryptoAccounts = userData.accounts
    function self.addCrypto(crypto, quantity)
        if NaturalCrypto.IsCryptoValid(crypto) then
            self.CryptoAccounts[crypto] = self.CryptoAccounts[crypto] + quantity
        else
            print("^7[^2NaturalCrypto^7] Invalid addCrypto function for player " .. self.name ..
                " with Crypto " .. crypto .. ".")
        end
    end

    function self.removeCrypto(crypto, quantity)
        if NaturalCrypto.IsCryptoValid(crypto) then
            self.CryptoAccounts[crypto] = self.CryptoAccounts[crypto] - quantity
        else
            print("^7[^2NaturalCrypto^7] Invalid removeCrypto function for player " .. self.name ..
                " with Crypto " .. crypto .. ".")
        end
    end

    function self.setCrypto(crypto, quantity)
        if NaturalCrypto.IsCryptoValid(crypto) then
            self.CryptoAccounts[crypto] = quantity
        else
            print("^7[^2NaturalCrypto^7] Invalid setCrypto function for player " .. self.name ..
                " with Crypto " .. crypto .. ".")
        end
    end

    function self.getCrypto(crypto)
        return self.CryptoAccounts[crypto]
    end

    function self.getAccounts()
        return self.CryptoAccounts
    end

    function self.getAccount(account)
        return self.CryptoAccounts[account]
    end

    function self.getIdentifier()
        return self.identifier
    end

    return self
end
