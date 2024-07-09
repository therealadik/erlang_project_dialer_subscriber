-module(udp_client).
-export([send_message/3]).

send_message(Host, Port, Message) ->
    {ok, Socket} = gen_udp:open(0, [binary]),
    gen_udp:send(Socket, Host, Port, Message),
    io:format("Sent: ~s to ~p:~p~n", [Message, Host, Port]),
    gen_udp:close(Socket).
