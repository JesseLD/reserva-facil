<?php

namespace App\Controllers;

use Core\Controller;
use App\Models\Shopkeeper;
use App\Models\StateModel;
use App\Models\StoreCategoryModel;
use App\Requests\ShopkeeperRequest;
use Core\Database;
use Core\Request;
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

    public function store()
    {
        // Handle POST to create Shopkeeper

        $request = Request::all();
        $db = Database::connection();

        // Validate request data
        $validator = Validator::requireFields($request, [
            'ownerName',
            'phone',
            'email',
            'cep',
            'state',
            'city',
            'address',
            'category',
            'name',
            'capacity',
            'maxPartySize',
            'cpfCnpj',
            'password',
        ]);

        $exists = $db->prepare("SELECT * FROM Store WHERE email = ? OR cpfCnpj = ? or phone = ?");
        $exists->execute([$request['email'], $request['cpfCnpj'], $request['phone']]);
        $exists = $exists->fetch();

        if ($exists) {
            set_error_flash("Loja já cadastrada!");
            return redirect('/register');
        }


        $insertStoreStmt = $db->prepare("INSERT INTO Store 
(ownerName, phone, email, name, categoryId, capacity, maxPartySize, cpfCnpj, password)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);
        ");
        $insertStoreStmt->execute([
            $request['ownerName'],
            $request['phone'],
            $request['email'],
            $request['name'],
            $request['category'],
            $request['capacity'],
            $request['maxPartySize'],
            $request['cpfCnpj'],
            password_hash($request['password'], PASSWORD_DEFAULT),
        ]);

        $insertStoreLocalizationStmt = $db->prepare("INSERT INTO StoreLocalization
(cep, stateId, city, address, storeId) VALUES (?, ?, ?, ?, ?);
        ");
        $insertStoreLocalizationStmt->execute([
            $request['cep'],
            $request['state'],
            $request['city'],
            $request['address'],
            $db->lastInsertId(),
        ]);

        set_success_flash("Cadastro efetuado com sucesso!");
        return redirect('/login');
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
