# https://github.com/comboy/bitcoin-elixir
# https://github.com/justinlynn/bitcoin-ex

['seed.bitcoin.sipa.be',
 'dnsseed.bluematt.me',
 'dnsseed.bitcoin.dashjr.org',
 'seed.bitcoinstats.com',
 'seed.bitcoin.jonasschnelli.ch',
 'seed.btc.petertodd.org']
|> List.first
|> :inet_res.lookup(:in, :a)
|> List.first
|> :gen_tcp.connect(8333, [:binary, active: true])
|> case do
     {:ok, socket} -> IO.puts("Connected!")
     {:error, reason} -> IO.puts("Error connecting #{inspect reason}")
   end
