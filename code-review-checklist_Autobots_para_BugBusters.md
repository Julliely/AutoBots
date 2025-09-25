# Code Review Checklist - Feedback Consolidado

**Squad que fez o CR (revisora):** Autobots
**Squad que recebeu o CR (revisada):** BugBusters

**Repositório/Projeto:** https://github.com/wesssl/pb-bugbusters/tree/main
**Módulos/PRs revisados:** _Autenticação, Cadastro, Estrutura de testes_
**Data:** 2025-09-25
**Revisores(as):** _Squad Autobots_

---

## 1) Resumo do CR
- **Estado geral:** **Requer ajustes** (bloqueios leves antes de merge)
- **Principais destaques:**
  - Boa organização inicial de cenários e uso de fixtures onde aplicável.
  - Pipeline de testes presente e casos felizes bem cobertos.
- **Riscos/observações:**
  - Fragilidade em seletores e dados hardcoded pode gerar flakiness.
  - Estrutura de páginas/keywords ainda acoplada aos testes.

---

## 2) Checklist (marcar o que foi verificado)

### Qualidade & Manutenibilidade
- [x] Padrões de código e linters seguidos (nomenclatura, formatação, estilo)
- [x] Complexidade adequada (métodos curtos, coesão, baixo acoplamento)
- [ ] DRY/KISS/YAGNI aplicados (evitar duplicação e overengineering)
- [x] Comentários e nomes expressivos onde necessário
- [ ] Estrutura de pastas e camadas coerente (controllers/services/repositories/etc.)

### Testes
- [x] Build/CI passam local e remoto
- [ ] Cobertura de testes suficiente para regras críticas
- [ ] Testes unitários cobrindo cenários felizes e de erro
- [ ] Testes de integração/end-to-end quando aplicável
- [ ] Testes são determinísticos (sem dependência frágil de ambiente)

### Segurança
- [ ] Validação e sanitização de entrada (back-end e front-end)
- [x] Autenticação e autorização corretas (RBAC/roles/permissions)
- [ ] Segredos via variáveis de ambiente (sem credenciais no código)
- [ ] SQL/NoSQL injection, XSS, CSRF e outras OWASP tratadas

### API & Contratos (se houver)
- [ ] Contratos estáveis e versionados (ex.: /v1)
- [x] Status codes e mensagens padronizados
- [ ] Idempotência em endpoints sensíveis

### Documentação & Operação
- [x] README com setup, run, testes e deploy
- [x] Scripts de build/teste/lint/documentados (Makefile/NPM/Yarn/Scripts)

---

## 3) Pontos de Melhoria Consolidados

### 3.1. Estrutura e Organização
- **Padrão Page Object Model (POM):** Atualmente, elementos e ações estão misturados nos arquivos de testes. Crie uma estrutura de páginas separadas na pasta `pages/`, como `cadastro_page.robot` e `login_page.robot`, para melhorar a reutilização de código e a manutenibilidade.
- **Organização de Recursos:** O arquivo `resources.robot` está vazio. Mova as keywords genéricas para este arquivo e mantenha as keywords específicas em suas respectivas páginas.
- **Estrutura de Arquivos Sugerida:** Mantenha a seguinte estrutura para o projeto: