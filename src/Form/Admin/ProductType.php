<?php

namespace App\Form\Admin;

use App\Entity\Admin\Product;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProductType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title')
            ->add('keywords')
            ->add('description')
            ->add('type')
            ->add('publisher_id')
            ->add('years')
            ->add('amount')
            ->add('price')
            ->add('sprice')
            ->add('minamount')
            ->add('detail')
            ->add('image')
            ->add('producer_id')
            ->add('category_id')
            ->add('status')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Product::class,
            'csrf_protection' => false,
        ]);
    }
}
