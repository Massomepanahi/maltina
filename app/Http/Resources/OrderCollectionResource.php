<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class OrderCollectionResource  extends ResourceCollection
{
    public function toArray($request)
    {
        return
            $this->collection->map(function ($item) {
                return [
                    'Count' => $item->count,
                    'Product' => $item->Product->product,
                    'Amount' => (int)$item->amount,
                    'Status' => $item->status,
                    'OptionType' => $item->Product->Option->OptionType,
                    'ConsumeLocation' => 'in shop',

                ];
            });
    }
}
