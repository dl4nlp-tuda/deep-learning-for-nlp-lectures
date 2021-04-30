import torch
import torch.nn as nn

torch.manual_seed(1)

class EmbeddingLayer(nn.Module):
    def __init__(self,voc_size, emb_size):
        super(EmbeddingLayer, self).__init__()

        self.embedding = nn.Embedding(voc_size,emb_size)

    def forward(self,inputs):
        embed = self.embedding(inputs)
        return embed

if __name__ == '__main__':
    model = EmbeddingLayer(voc_size=10, emb_size=3)

    inputs = [1,5]
    inputs_tenseor = torch.tensor(inputs, dtype=torch.long)
    emb_vectors = model(inputs_tenseor)
    print(f"the shape of emb_vectors is {emb_vectors.shape}")


