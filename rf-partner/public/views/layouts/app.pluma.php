<?php

use Core\View; ?>
<!DOCTYPE html>
<html lang="en">
<?= include_partial('head'); ?>

<?php 

  $success = get_success_flash();
  $error = get_error_flash();

?>

<body class="bg-slate-100">

  <main class="container mx-auto p-4">

    <!-- Success Flash Message -->
    <?php if ($success): ?>
      <div class="bg-green-100 text-green-700 border border-green-300 px-4 py-3 rounded mb-4">
        <?= e($success) ?>
      </div>
    <?php endif; ?>

    <!-- Error Flash Message -->
    <?php if ($error): ?>
      <div class="bg-red-100 text-red-700 border border-red-300 px-4 py-3 rounded mb-4">
        <?= e($error) ?>
      </div>
    <?php endif; ?>

    <!-- Main Content Section -->
    <?php View::section('content'); ?>
    <?= include_partial('end'); ?>

</body>

</html>