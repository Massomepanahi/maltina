<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Laravel\Passport\HasApiTokens;

class UserController extends Controller
{

    use HasApiTokens;

    public function login(Request $request)
    {

        $validatedData = $request->validate([
            'email' => 'required|email',
            'password' => 'required|email',


        ]);

        $user = User::where('email', $request->email)->first();
        if (!$user) {
            $msg = 'Not found user';
            return Response()->json(['message' => $msg])->setStatusCode(400);
        }

        $msg = 'Welcome' . $user->name;

        return Response()->json(['message' => $msg])->setStatusCode(200);


    }

    public
    function register(Request $request)
    {
        $validatedData = $request->validate([
            'email' => 'required|email|unique:users',
            'name' => 'required|max:255',
            'password' => 'required|string|min:8',

        ]);


        $user = User::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'password' => Hash::make($request['password']),

        ]);

        $tokenResult = $user->createToken('PersonalAccessToken');
        $tokenModel = $tokenResult->accessToken;
        $tokenModel->save();

        return Response()->json([
            'message' => "Welcome to Rock star shop",
            'token' => $tokenResult->accessToken,
            'token_type' => 'Bearer'
        ])->setStatusCode(200);
    }

    public function logOut(Request $request){

        $request->user()->token()->revoke();

        return Response()->json(['message' => "شما با موفقیت خارج شدید." . "\n" . "You have successfully logged out."])->setStatusCode(200);


    }
}
