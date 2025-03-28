<?php

extend('auth');
section('content');
set_title('Reservas');

/**
 * Customer
 * date
 * partySize
 * status
 * id
 * 
 */
?>

<section class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
  <?php foreach ($reservations as $reservation): ?>
    <div class="bg-white shadow rounded-lg p-4 flex flex-col justify-between">
      
      <div>
        <h3 class="text-lg font-semibold text-gray-800"><?= e($reservation["customer"]) ?></h3>
        <p class="text-sm text-gray-500">
          <?= date('d/m/Y H:i', strtotime($reservation["date"])) ?>
        </p>
        <p class="text-sm text-gray-600">
          Pessoas: <strong><?= e($reservation["partySize"]) ?></strong>
        </p>
      </div>

      <div class="mt-4 flex justify-between items-center">
        <span class="px-2 py-1 rounded text-xs font-semibold
          <?= $reservation["status"] == 'confirmed' ? 'bg-green-100 text-green-700' : 
              ($reservation["status"] == 'pending' ? 'bg-yellow-100 text-yellow-700' : 'bg-red-100 text-red-700') ?>">
          <?= ucfirst($reservation["status"]) ?>
        </span>

        <?php if ($reservation["status"] == 'pending'): ?>
          <div class="space-x-2">
            <a href="<?= "/reservations/confirm/" . $reservation["id"] ?>">
              <button data-id="<?= $reservation["id"] ?>" class="accept-btn text-xs bg-green-500 hover:bg-green-600 text-white px-2 py-1 rounded">
                Aceitar
              </button>
            </a>
            <a href="<?= "/reservations/cancel/" . $reservation["id"] ?>">
              <button data-id="<?= $reservation["id"] ?>" class="cancel-btn text-xs bg-red-500 hover:bg-red-600 text-white px-2 py-1 rounded">
                Cancelar
              </button>
            </a>
          </div>
        <?php endif; ?>
      </div>
      
    </div>
  <?php endforeach; ?>
</section>

<?php endSection(); ?>