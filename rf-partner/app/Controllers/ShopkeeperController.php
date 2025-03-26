<?php

namespace App\Controllers;

use Core\Controller;
use App\Models\Shopkeeper;
use App\Models\StateModel;
use App\Models\StoreCategoryModel;
use App\Requests\ShopkeeperRequest;
use Core\Response;
use Core\Validator;

class ShopkeeperController extends Controller
{
    public function index()
    {
        // List all Shopkeepers
    }

    public function create()
    {
        // Show form to create a new Shopkeeper
        $states =  StateModel::all();
        $categories = StoreCategoryModel::all();


        return $this->view('shopkeepers.create', [
            'states' => $states,
            'categories' => $categories
        ]);
    }

    public function store($request)
    {
        // Handle POST to create Shopkeeper

        // Validate request data
        $validator =  Validator::requireFields($request->all(), [
            'owner_name',
            'phone',
            'email',
            'cep',
            'state',
            'city',
            'address',
            'especialidade',
            'nome_loja',
            'capacity',
            'max_party_size',
            'cnpj',
            'password',
        ]);

     

        // Check if email already exists
        if (StateModel::where('email', $request->email)->first()) {
            return Response::redirect('/register');
        }

        

        echo $request;
        exit;

        // // Save the user
        // $user = new StateModel([
        //     'owner_name'     => $request->owner_name,
        //     'phone'          => $request->phone,
        //     'email'          => $request->email,
        //     'cep'            => $request->cep,
        //     'state_id'       => $request->state,
        //     'city'           => $request->city,
        //     'address'        => $request->address,
        //     'category_id'    => $request->especialidade,
        //     'store_name'     => $request->nome_loja,
        //     'capacity'       => $request->capacity,
        //     'max_party_size' => $request->max_party_size,
        //     'cnpj'           => $request->cnpj,
        //     'password'       => password_hash($request->password, PASSWORD_DEFAULT),
        // ]);

        // $user->save();

        // // Redirect after successful registration
        // return Response::redirect('/login')->with('success', 'Cadastro efetuado com sucesso!');
    }

    public function show($id)
    {
        // Show a single Shopkeeper
    }

    public function edit($id)
    {
        // Show form to edit Shopkeeper
    }

    public function update($id)
    {
        // Handle PUT to update Shopkeeper
    }

    public function destroy($id)
    {
        // Handle DELETE to delete Shopkeeper
    }
}
