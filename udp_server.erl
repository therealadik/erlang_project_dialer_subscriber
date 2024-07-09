-module(udp_server).
-export([start/1]).

start(Port) ->
    {ok, Socket} = gen_udp:open(Port, [binary, {active, once}]),
    io:format("Server started on port ~p~n", [Port]),
    loop(Socket).

loop(Socket) ->
    receive
        {udp, Socket, Host, Port, Bin} ->
            io:format("Received: ~s from ~p:~p~n", [Bin, Host, Port]),
            inet:setopts(Socket, [{active, once}]),
            loop(Socket)
    after 1000 ->
        loop(Socket)
    end.
