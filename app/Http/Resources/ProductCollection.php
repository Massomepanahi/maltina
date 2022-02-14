<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class ProductCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return
            $this->collection->map(function ($item) {
                return [
                    'Id' => $item->id,
                    'Product' => $item->title,
                    'Price' => (int)$item->price,
                    'Option' => $item->Option->name,
                    'OptionType' => new OptionTypeCollection($item->Option->OptionType),
                ];
            });
    }
}
