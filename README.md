# ReservaFácil

**ReservaFácil** é um sistema de reservas para restaurantes, permitindo aos usuários realizarem reservas, visualizarem menus, horários de funcionamento e avaliações dos restaurantes, tudo em uma plataforma prática e intuitiva.

## Endereços

- **[Web Site](https://reservafacil.site/)** - Site Principal do APP
- **[Aplicativo](https://app.reservafacil.site/)** - Endereço Web do App
- **[Painel Gestor](https://painel.reservafacil.site/)** - Acesso Painel Gestor
- **[Api](https://api.reservafacil.site/)** - Endereço da Api Principal

## Funcionalidades

- **Reservas de Mesas**: Permite aos usuários fazer reservas em restaurantes selecionando data, horário e número de pessoas.
- **Perfis de Restaurantes**: Exibição de informações detalhadas sobre cada restaurante, incluindo menus e horários de funcionamento.
- **Avaliações e Comentários**: Sistema para os usuários deixarem avaliações e comentários sobre suas experiências.
- **Localização com Google Maps API**: Integração com Google Maps para facilitar a localização dos restaurantes.
- **Notificações**: Confirmações e lembretes de reservas via e-mail ou push notifications.

## Arquitetura e Tecnologias

- **Frontend**: Desenvolvido com Flutter, para compatibilidade multiplataforma.
- **Backend**: API RESTful em Go para gerenciamento das operações de CRUD.
- **Banco de Dados**: MySQL ou PostgreSQL para armazenamento dos dados.
- **Integração com APIs**: Google Maps API para localização.
- **Notificações**: Push notifications e/ou e-mail para confirmar e lembrar as reservas.

## Estrutura do Projeto

```plaintext
reserva-facil/
├── reservafacil_api/          # Código da API em Go
│   ├── controllers/           # Controladores da API
│   ├── models/                # Modelos de dados
│   ├── routes/                # Definição de rotas
│   ├── services/              # Lógica de negócios
│   └── main.go                # Arquivo principal da API
├── reservafacil_app/
│   ├── lib/
│   │   ├── core/
│   │   │   ├── api/                    # Serviços de API
│   │   │   ├── config/                 # Configurações gerais (env, chaves)
│   │   │   ├── shared/                 # Elementos compartilhados
│   │   │   ├── constants/              # Constantes (strings, dimensões)
│   │   │   └── utils/                  # Funções de utilidade
│   │   ├── features/
│   │   │   ├── home/
│   │   │   │   ├── data/
│   │   │   │   │   ├── models/         # Modelos de dados para home
│   │   │   │   │   ├── datasources     # Múltiplos data sources
│   │   │   │   │   └── repositories/   # Repositórios de dados
│   │   │   │   ├── logic/
│   │   │   │   │   └── providers/      # Gerenciamento de estado
│   │   │   │   └── presentation/
│   │   │   │       ├── pages/          # Telas da funcionalidade
│   │   │   │       └── widgets/        # Widgets específicos de home
│   │   │   └── ...                     # Outras features (reservations, profile)
│   │   ├── theme/
│   │   │   ├── components/             # Componentes reutilizáveis de UI
│   │   │   ├── light_theme/            # Configuração de tema claro
│   │   │   ├── dark_theme/             # Configuração de tema escuro
│   │   │   └── custom_colors.dart      # Paleta de cores personalizadas
│       └── main.dart                   # Arquivo principal da aplicação
├── docs/                      # Documentação do projeto
│   ├── slides/                # Slides para apresentação
│   └── report/                # Relatório em formato PDF
├── LICENSE                    # Licença do projeto
└── README.md                  # Documentação principal do projeto


