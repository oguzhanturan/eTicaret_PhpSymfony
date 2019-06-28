<?php

namespace App\Repository;

use App\Entity\Shopcarts;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use phpDocumentor\Reflection\Types\Integer;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method Shopcarts|null find($id, $lockMode = null, $lockVersion = null)
 * @method Shopcarts|null findOneBy(array $criteria, array $orderBy = null)
 * @method Shopcarts[]    findAll()
 * @method Shopcarts[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ShopcartsRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Shopcarts::class);
    }
    public function getUserShopCart($userid): array
    {
        $em = $this->getEntityManager();
        $query = $em->createQuery('
            SELECT p.title, p.price,p.amount, s.quantity,s.productid, s.userid, (p.price * s.quantity) as total
            FROM App\Entity\Shopcarts s, App\Entity\Admin\Product p
            WHERE s.productid = p.id and s.userid=:userid
        ')
            ->setParameter('userid',$userid);
        return $query->getResult();
    }

    public function getUserShopCartTotal($userid): float
    {
        $em = $this->getEntityManager();
        $query = $em->createQuery('
            SELECT sum(p.sprice *s .quantity) as total
            FROM App\Entity\Shopcarts s, App\Entity\Admin\Product p
            WHERE s.productid = p.id and s.userid=:userid
        ')
            ->setParameter('userid',$userid);
        $result = $query->getResult();

        if($result[0]["total"]!=null){
            return $result[0]["total"];

        }
        else{
            return 0;
        }
    }
    public function getUserShopCartCount($userid): Integer
    {
        $em = $this->getEntityManager();
        $query = $em->createQuery('
            SELECT count(s.id) as shopcount
            FROM App\Entity\Shopcarts s
            WHERE s.userid=:userid
        ')
            ->setParameter('userid',$userid);
            $result = $query->getResult();

                if($result[0]["shopcount"]!=0){
                    return $result[0]["shopcount"];

                }
                else{
                    return 0;
                }
    }

    // /**
    //  * @return Shopcarts[] Returns an array of Shopcarts objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('s.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Shopcarts
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
