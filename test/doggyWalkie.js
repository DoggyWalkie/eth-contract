let DoggyWalkie = artifacts.require("./DoggyWalkie.sol");
const BigNumber = web3.BigNumber;

require('chai')
    .use(require('chai-bignumber')(BigNumber))
    .should();


contract('DoggyWalkie', function(accounts) {
    before(async function () {

    });

    beforeEach(async function () {
        this.doggyWalkie = await DoggyWalkie.new();
    });
    context('Token mint', function () {
        it("as a OWNER i can create a new token", async function () {
            let tomorrow = new Date();
            tomorrow.setDate(tomorrow.getDate() + 1);
            await this.doggyWalkie.mintWithTokenURI(accounts[0], 0, Date.now() + ":" + tomorrow.getTime(), {
                from: accounts[0]
            });
            (await this.doggyWalkie.balanceOf(accounts[0])).should.be.bignumber.equal(1);
        });

        it("as a USER i can create a new token", async function () {//TODO spam?
            let tomorrow = new Date();
            tomorrow.setDate(tomorrow.getDate() + 1);
            await this.doggyWalkie.mintWithTokenURI(accounts[1], 0, Date.now() + ":" + tomorrow.getTime(), {
                from: accounts[1]
            });
            (await this.doggyWalkie.balanceOf(accounts[1])).should.be.bignumber.equal(1);
        });

        it("as a OWNER i can't stop minting", async function(){
            (await this.doggyWalkie.finishMinting.call()).should.be.equal(false);
        });

        it("as a USER i can't stop minting", async function(){
            (await this.doggyWalkie.finishMinting.call({from:accounts[1]})).should.be.equal(false);
        });

        it("purchaseToken", async function(){
            (await this.doggyWalkie.purchaseToken.call(3).should.be.ok);
            (await this.doggyWalkie.purchaseToken.call(3).should.be.throw);
        })

    });


});
