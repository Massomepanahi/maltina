<?php

namespace App\Http\Controllers;

use App\Jobs\SendEmail;
use App\Models\Order;
use App\Models\Product;
use http\Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class AdminController extends Controller
{
    public function store(Request $request)
    {

        $validatedData = $request->validate(
            [
                'title' => 'required|string',
                'price' => 'required|integer',
                'option_id' => 'required|exists:App\Models\Option,id',

            ]);

                  $pro = new Product();
        try {
            $pro->title = $request->title;
            $pro->price = $request->price;
            $pro->option_id = $request->option_id;


            if ($pro->save()) {
                $msg = 'New Product Created.';

                return Response()->json(
                    ['message' => $msg]
                )->setStatusCode(200);
            } else {
                return Response()->json(['message' => "Error"])->setStatusCode(400);
            }

        } catch (\Throwable $ex) {
            $msg = 'فیلدها را کامل کنید';
            return Response()->json(['message' => $msg])->setStatusCode(400);}







    }

    public function updateStatusOrder(Request $request){
        $validatedData = $request->validate(
            [
                'status' => 'required|Integer',
                'order_id' => 'required|exists:App\Models\Order,id',

            ]
        );


        $order = Order::find($request->order_id);
        $order['status'] = $request->status;
// status state:  1=>waiting , 2=>preparation, 3=>ready ,4=>delivered, 5=>cancel

        $isUpdated = $order->save();
        if ($isUpdated){
          switch ($order->status){
              case 1:
                  $lblStatus='waiting';
              break;
              case 2:
                  $lblStatus='preparation';
              break;
              case 3:
                  $lblStatus='ready';
                  break;
              case 4:
                  $lblStatus='delivered';
                  break;
              case 5:
                  $lblStatus='cancel';
                  break;
          }

            $data = [
                'status'     => $lblStatus,
                'user' => $request->user()->name,
                'order_id' => $order->id,
            ];

            $result = $this->dispatch(new SendEmail($request->user()->email, $data));
            $msg = 'Order is change status';
            return Response()->json(['message' => $msg])->setStatusCode(200);
        }


        $msg = 'Error';
        return Response()->json(['message' => $msg])->setStatusCode(400);
    }
}
