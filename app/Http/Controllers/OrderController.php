<?php

namespace App\Http\Controllers;

use App\Http\Resources\OrderCollectionResource;
use App\Models\Order;
use App\Models\User;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function store(Request $request)
    {
        $validatedData = $request->validate(
            [
                'count' => 'required|Integer|min:1',
                'product_id' => 'required|exists:App\Models\Product,id',
                'OptionType_id' => 'required|exists:App\Models\OptionType,id',
                'price' => 'required',
            ]
        );
        $user = User::find($request->user()->id);

// status state:  1=>waiting , 2=>preparation, 3=>ready ,4=>delivered, 5=>cancel

        if ($user) {
            $order = Order::create(
                [
                    'user_id' => $user->id,
                    'product_id' => $request->product_id,
                    'amount' => $request->count * $request->price,
                    'status' => 1,
                    'OptionType_id' => $request->OptionType_id
                ]
            );

            if (!$order) {
                $msg = 'Erroe';
                return Response()->json(['message' => $msg])->setStatusCode(400);
            }
        } else {
            $msg = 'Not found user';
            return Response()->json(['message' => $msg])->setStatusCode(400);
        }

        $msg = 'Order is register successfully';
        return Response()->json(['message' => $msg])->setStatusCode(200);
    }

    public function orders(Request $request)
    {
        $orders = Order::where('user_id', $request->user()->id)->get();
        return new OrderCollectionResource($orders);
    }

    public function updateStatusOrder(Request $request)
    {
        $validatedData = $request->validate(
            [
                'status' => 'required|Integer',
                'order_id' => 'required|exists:App\Models\Order,id',

            ]
        );
        $order = Order::find($request->order_id);
        $order['status'] = $request->status;

        $isUpdated = $order->save();
        if ($isUpdated) {
            $msg = 'Order is change status';
            return Response()->json(['message' => $msg])->setStatusCode(200);
        }
        $msg = 'Error';
        return Response()->json(['message' => $msg])->setStatusCode(400);
    }

    public function cancelOrder(Request $request)
    {
        $validatedData = $request->validate(
            [
                'order_id' => 'required|exists:App\Models\Order,id',
            ]
        );
        //--- 5=> cancel
        $order = Order::find($request->order_id);
        $order['status'] = 5;

        $isUpdated = $order->save();
        $msg = 'Order is canceled';
        return Response()->json(['message' => $msg])->setStatusCode(200);
    }


}
