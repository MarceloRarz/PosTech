const Post = require("../model/Post");
const { Op } = require("sequelize");

module.exports = class postController {
  // Rota para pegar todos os posts
  static async main(req, res) {
    try {
      const listPosts = await Post.findAll();
      res.status(200).json(listPosts);
    } catch (error) {
      res.status(500).json({ error: "Erro ao buscar posts" });
    }
  }

  // Rota para pegar um post em específico
  static async single(req, res) {
    try {
      const post = await Post.findByPk(parseInt(req.params.id));
      if (!post) return res.status(404).json({ error: "Post não encontrado." });
      res.status(200).json(post);
    } catch (error) {
      res.status(500).json({ error: "Erro ao buscar post" });
    }
  }

  // Rota para criar novo post
  static async novo(req, res) {
    const dados = req.body;

    if (!dados.titulo || !dados.descricao || !dados.conteudo || !dados.imagem) {
      return res.status(400).json({ error: "Post não criado! Faltam dados." });
    }

    try {
      const data = new Date();
      const dia = String(data.getDate()).padStart(2, "0");
      const mes = String(data.getMonth() + 1).padStart(2, "0");
      const ano = data.getFullYear();

      const novo = {
        titulo: dados.titulo,
        descricao: dados.descricao,
        conteudo: dados.conteudo,
        imagem: dados.imagem,
        datapostagem: `${ano}-${mes}-${dia}`,
      };

      await Post.create(novo);
      res.status(201).json({ message: "Post Criado com Sucesso!" });
    } catch (error) {
      res.status(500).json({ error: "Erro ao criar post" });
    }
  }

  // Rota para atualizar post
  static async atualizar(req, res) {
    const dados = req.body;
    const id = req.params.id;

    try {
      const data = new Date();
      const dia = String(data.getDate()).padStart(2, "0");
      const mes = String(data.getMonth() + 1).padStart(2, "0");
      const ano = data.getFullYear();

      const update = {
        titulo: dados.titulo,
        descricao: dados.descricao,
        conteudo: dados.conteudo,
        imagem: dados.imagem,
        dataatualizacao: `${ano}-${mes}-${dia}`,
      };

      const [updated] = await Post.update(update, { where: { id: id } });
      if (updated) {
        res.status(200).json({ message: "Post Atualizado com sucesso!" });
      } else {
        res.status(404).json({ error: "Post não encontrado" });
      }
    } catch (error) {
      res.status(500).json({ error: "Erro ao atualizar post" });
    }
  }

  // Rota para pegar todos os posts (Admin)
  static async admin(req, res) {
    try {
      const listPosts = await Post.findAll();
      res.status(200).json(listPosts);
    } catch (error) {
      res.status(500).json({ error: "Erro ao buscar posts" });
    }
  }

  // Rota para excluir post
  static async delete(req, res) {
    const id = req.params.id;

    try {
      const deleted = await Post.destroy({ where: { id: id } });
      if (deleted) {
        res.status(200).json({ message: "Post Deletado com Sucesso!" });
      } else {
        res.status(404).json({ error: "Post não encontrado" });
      }
    } catch (error) {
      res.status(500).json({ error: "Erro ao deletar post" });
    }
  }

  // Rota para pesquisa
  static async pesquisa(req, res) {
    const pesquisa = req.query.search;

    try {
      const posts = await Post.findAll({
        where: {
          [Op.or]: [
            {
              titulo: {
                [Op.like]: `%${pesquisa}%`,
              },
            },
            {
              conteudo: {
                [Op.like]: `%${pesquisa}%`,
              },
            },
          ],
        },
      });
      res.status(200).json(posts);
    } catch (error) {
      res.status(500).json({ error: "Erro ao buscar posts" });
    }
  }
};
